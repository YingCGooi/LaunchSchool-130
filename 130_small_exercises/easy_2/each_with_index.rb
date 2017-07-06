# def each_with_index(collection)
#   idx = 0

#   while idx < collection.size
#     yield(collection[idx], idx)
#     idx += 1
#   end

#   collection
# end

def each_with_index(arr, idx=0, &block)
  return arr if idx >= arr.size
  block.call(arr[idx], idx)
  idx += 1
  each_with_index(arr, idx, &block)
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]