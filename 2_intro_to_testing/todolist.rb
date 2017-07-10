# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class TodoRunTimeError < RuntimeError; end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# # puts todo1; puts todo2; puts todo3

# todo1.done!

# puts todo1
# puts todo2
# puts todo3

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo_obj)
    raise TypeError, 'can only add Todo objects' unless todo_obj.instance_of? Todo

    @todos << todo_obj
  end
  alias_method :add, :<<

  def to_a
    @todos.clone
  end

  def size
    to_a.size
  end

  def first
    to_a.first
  end

  def last
    to_a.last
  end

  def item_at(idx)
    to_a.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx)
    @todos[idx].done!
  end

  def mark_undone_at(idx)
    item_at(idx)
    @todos[idx].undone!
  end

  def shift
    item_at(0)
    @todos.shift
  end

  def pop
    item_at(-1)
    @todos.pop
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def done!
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def to_s
    "---- Today's Todos ----\n" +
    @todos.map(&:to_s).join("\n")
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    new_list = TodoList.new(title)
      each do |todo|
        new_list << todo if yield(todo)
      end
    new_list
  end

  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(str)
    find_by_title(str) && find_by_title(str).done!
    # each do |todo|
    #   return todo.done! if todo.title == str
    # end
    # false
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  def remove_at(idx)
    @todos.fetch(idx)
    @todos.delete_at(idx)
  end
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

list.each do |todo|
  puts todo  # calls Todo#to_s
end

puts
# we would rather not access an internal state of `TodoList` `@todos`
# This is the idea behind encapsulation - hide the implementation details from users of the `TodoList` class, and not encourage users of this class to reach into its internal state.

# we would rather use `TodoList#add` rather than work with the `TodoList#todos` getter method and modify the array.
# we don't allow any item into the list that's not a `Todo` object. Therefore, we enforce this rule in `TodoList#add`.

# suppose later we no longer want the internal representation to be an array, we'd need a different mechanism to iterate over the items in `TodoList`, all we have to do is to change the `TodoList#each` method. Users of `TodoList` class shouldn't feel any change at all.
# this is polymorphism

# However, if users of the TodoList class instead reached into the @todos variable directly, their code will break, since `@todos` is no longer an `Array`.

p list.select { |todo| todo.done? }    # you need to implement this method
puts

p list.find_by_title("Clean room") # => returns a Todo object which title matches the argument
puts

p list.all_done
puts

p list.all_not_done
puts

p list.to_s
p list.mark_done("Clean room")
puts list

# p list.mark_all_done
# puts list

# p list.mark_all_undone
# puts list