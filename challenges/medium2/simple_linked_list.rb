# Write a simple linked list implementation that uses Elements and a List.

# The linked list is a fundamental data structure in computer science, often used in the implementation of other data structures.

# The simplest kind of linked list is a singly linked list. Each element in the list contains data and a "next" field pointing to the next element in the list of elements. This variant of linked lists is often used to represent sequences or push-down stacks (also called a LIFO stack; Last In, First Out).

# Lets create a singly linked list to contain the range (1..10), and provide functions to reverse a linked list and convert to and from arrays.

class Element
  attr_reader :next, :datum

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def peek
    head&.datum
  end

  def head
    @list.first
  end

  def push(item)
    @list.unshift(Element.new(item, head))
  end

  def pop
    @list.shift.datum
  end

  def self.from_a(arr)
    new_list = new
    arr&.reverse_each { |item| new_list.push(item) }
    new_list
  end

  def to_a
    @list.map(&:datum)
  end

  def reverse
    self.class.from_a(to_a.reverse)
  end
end

p l = SimpleLinkedList.new
l.push(1)
l.push(2)
l.push(3)
p l
p l.to_a
p l.reverse