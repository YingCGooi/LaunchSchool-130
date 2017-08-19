# Write a program that inserts numbers and searches in a binary tree.

class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(sub_data)
    if sub_data <= data
      return @left&.insert(sub_data) || (@left = Bst.new(sub_data))
    end
    @right&.insert(sub_data) || (@right = Bst.new(sub_data))
  end

  def each
    return to_enum if !block_given?
    [left&.each {}, data, right&.each {}]
      .flatten.compact
      .each { |node| yield(node) }
  end
end

four = Bst.new 4
four.insert 2
four.insert 6
four.insert 1
four.insert 3
four.insert 7
four.insert 5

p four
# p Bst.collection
p four.each #{ |dat| p dat }
# p four.left.each { |d| d }

# p four.left.left  .data
# p four.left       .data
# p four.left.right .data
# p four           .data
# p four.right.left .data
# p four.right      .data
# p four.right.right.data

# use Rubocop