[1, 2, 3].reduce do |acc, num|
  acc + num
end # => 6

# [1, 2, 3].reduce do |acc, num|
#   acc + num if num.odd?
# end
# => NoMethodError: undefined method `+' for nil:NilClass

# At the second iteration, the accumulator is set to `nil` and calling `+` method `nil` will cause Ruby to throw an error.

# we can also initialize the accumulator to a default value,
# so that the first iteration will take the default value and assign it to `acc`

[1, 2, 3].reduce(10) do |acc, num|
  acc + num
end

def reduce(arr, acc=0, sym=nil)
  arr.each do |el|
    next acc = yield(acc, el) if block_given?
    acc = acc.send(sym, el)
  end

  acc
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }        # => 15
p reduce(array, 10) { |acc, num| acc + num }    # => 25
p reduce(array) { |acc, num| acc + num if num.odd? rescue "NoMethodError" }
# => NoMethodError: undefined method `+' for nil:NilClass
p reduce(array, 1, :*)