# Modify your solution so it only passes one element to the block at a time; the block should perform some sort of transformation to the argument, and #bubble_sort! itself should just use <= to compare two values. In other words, you should be able to call #bubble_sort! like this:

# def bubble_sort!(arr)
#   n = arr.size
#   loop do
#     swapped = false

#     (arr.size - 1).times do |idx| # Kernel#block_given is used here
#       if !block_given? && (arr[idx] <=> arr[idx + 1]) == 1 ||
#           block_given? && (yield(arr[idx]) <=> yield(arr[idx + 1])) == 1
#         arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
#         swapped = true
#       end
#     end

#     break if !swapped
#   end
# end

def bubble_sort!(arr, n = arr.size, &block)
  n.zero? ? (return arr) : new_n = 0
  (1...n).each do |idx|
    a, b = arr[idx - 1, 2].map { |x| block&.arity == 1 ? block.call(x) : x }
    next if (block&.arity == 2 ? block.call(a, b) : a <= b)
    print idx
    arr[idx - 1], arr[idx], new_n = arr[idx], arr[idx - 1], idx
  end
  bubble_sort!(arr, new_n, &block)
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

