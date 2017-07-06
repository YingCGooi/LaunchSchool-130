# def max_by(arr)
#   return nil if arr.empty?

#   max_element = arr[0]
#   current = yield(max_element)

#   arr[1..-1].each do |item|
#     yielded_value = yield(item)
#     if current < yielded_value
#       max_element = item
#       current = yielded_value
#     end
#   end

#   max_element
# end

def max_by(arr, max = arr.first, &block)
  return max if arr.size <= 1
  max = arr.first if block.call(max) < block.call(arr.first)
  max_by(arr.drop(1), max, &block)
end

p max_by([1, 5, 3]) { |value| value + 2 } #== 5
p max_by([1, 5, 3]) { |value| 9 - value } #== 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil