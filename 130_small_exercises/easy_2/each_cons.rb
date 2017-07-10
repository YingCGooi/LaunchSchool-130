# def each_cons(arr, num, &block)
#   arr.size < num ? return : (num == 1 ? block.call(arr[0]) : block.call(arr[0, num]))
#   each_cons(arr.drop(1), num, &block)
# end

def each_cons(arr, cons, &block)
  return if arr.size < cons
  cons == 1 ? block.call(arr[0]) : block.call(arr[0, cons])
  each_cons(arr.drop(1), cons, &block)
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}