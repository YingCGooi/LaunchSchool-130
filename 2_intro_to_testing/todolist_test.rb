require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_undone!
    @todo1.done!
    assert(@todo1.done?)

    @todo1.undone!
    refute(@todo1.done?)
  end

  def test_raise_typeerror_add_obj
    assert_raises(TypeError) { @list.add("Hello world") }
    assert_raises(TypeError) { @list.add(4) }
    assert_raises(TypeError) { @list.add(:something) }
  end

  def test_shovel
    original_size = @list.size
    new_todo = Todo.new('a')
    @list << new_todo

    assert_equal(@list.last, new_todo)
    assert_equal(original_size + 1, @list.size)
  end

  def test_add_alias_shovel
    new_todo = Todo.new("Walk the dog")
    @todos << new_todo
    @list.add(new_todo)

    assert_equal(@todos, @list.to_a)
  end

  def item_at
    assert_equal(@list.last, @list.item_at(-1))
    assert_equal(@todos[1], @list.item_at(1))
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) { @list.item_at(@todos.size + 1) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(@todos.size + 1) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(@todos.size + 1) }
    @todo1.done!
    @todo2.done!
    @todo3.done!

    @list.mark_undone_at(1)

    assert(@todo1.done)
    refute(@todo2.done)
    assert(@todo3.done)
  end

  def test_done!
    @list.done!
    assert(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)
    assert(@list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(999) }
    removed = @list.remove_at(1)

    assert_equal(@todo2, removed)
    refute_includes(@list.to_a, @todo2)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    assert_equal(@list, @list.each { |x| nil })

    result = []
    @list.each { |todo| result << todo }
    assert_includes(result, @todo1)
    assert_equal([@todo1, @todo2, @todo3], result)

    @list.each { |todo| todo.done! }
    assert(@list.done?)
  end

  def test_select
    refute_equal(@list, @list.select { |x| x })

    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)

    list.add(@todo2)
    list.add(@todo3)
    not_done_list = list.select{ |todo| !todo.done? }
    refute_includes(not_done_list.to_a, @todo1)
    assert_includes(not_done_list.to_a, @todo2)
    assert_includes(not_done_list.to_a, @todo3)
  end

  def test_find_by_title
    todo_found = @list.find_by_title("Buy milk")

    refute_nil(todo_found)
    assert_equal(todo_found, @todo1)
    refute(@todo1.done?)
  end

  def test_mark_done
    assert(@list.mark_done("Buy milk"))
    assert(@todo1.done?)
  end

  def test_remove_at
    @list.remove_at(1)

    refute_includes(@list.to_a, @todo2)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_all_done
    @todo1.done!

    assert_equal([@todo1], @list.all_done.to_a)

    @todo2.done!
    assert_equal([@todo1, @todo2], @list.all_done.to_a)

    @todo3.done!
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    @todo2.done!
    @todo3.done!
    all_not_done_list = @list.all_not_done

    assert_equal([], all_not_done_list.to_a)
    assert_equal([], all_not_done_list.select { |todo| todo.done? }.to_a )
  end

  def test_mark_all_done
    assert_equal(@todos, @list.select { |todo| !todo.done? }.to_a)

    @list.mark_all_done
    assert_equal(@todos, @list.select { |todo| todo.done? }.to_a)
  end

  def test_mark_all_undone
    assert_equal(@todos, @list.select { |todo| !todo.done? }.to_a)

    @todo2.done!
    @todo3.done!
    refute(@todo1.done?)
    assert(@todo2.done?)
    assert(@todo3.done?)

    @list.mark_all_undone
    assert_equal([], @list.select(&:done?).to_a)
    refute(@todo2.done?)
  end
end