# def each_cons(arr, idx1=0, idx2=1, &block)
#   return if idx2 >= arr.size
#   block.call(arr[idx1], arr[idx2])
#   each_cons(arr, idx1 + 1, idx2 + 1, &block)
# end

def each_cons(arr, &block)
  arr.size < 2 ? return : block.call(arr[0, 2])
  each_cons(arr.drop(1), &block)
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}