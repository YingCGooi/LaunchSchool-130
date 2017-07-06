# def none?(collection)
#   collection.each do |item|
#     return false if yield(item)
#   end
#   true
# end

# def none?(collection, &block)
#   !any?(collection, &block)
# end

def none?(arr)
  arr.each { |elem| yield(elem) && (return false) }
  # yield(elem) has to be true for && operator to evaluate the `return false` expression
  # if yield(elem) is false, then && gets short circuit and `return false` is not evaluated
end



p none?([1, 3, 5, 6]) { |value| value.even? } #== false
p none?([1, 3, 5, 7]) { |value| value.even? } #== true
p none?([2, 4, 6, 8]) { |value| value.odd? } #== true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } #== false
p none?([1, 3, 5, 7]) { |value| true } #== false
p none?([1, 3, 5, 7]) { |value| false } #== true
p none?([]) { |value| false } #== true


# def none?(collection)
#   !any?(collection)
# end
# will throw an error message: no block given (yield) (LocalJumpError)
# block's aren't passed down the calling chain by default, you need to explicitly pass the block to #any?
# #none? must require a block argument with an `&` shown.

