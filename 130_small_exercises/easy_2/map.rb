# def map(arr)
#   arr.each_with_object([]) do |item, obj|
#     obj << yield(item)
#   end
# end
require 'set'

def map(collection)
  with_object(collection, []) { |item, arr| arr << yield(item) }
end

def with_object(collection, obj)
  collection.each { |item| yield(item, obj) }
  obj
end

hash = { 1=> "m", 2=> "c", 3=> "s" }
set = Set[1, 3, 6]

p map(hash) { |_, v| v += "at" } == ["mat", "cat", "sat"]
p map(set) { |value| value**2 } == [1, 9, 36]
p map({}) { |value| true } == []
p map(Set[]) { |value| true } == []
p map(hash) { |value| false } == [false, false, false]
p map(set) { |value| false } == [false, false, false]
p map(hash) { |_, value| value.upcase } == ['M', 'C', 'S']
p map(set) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4, 5, 6]]