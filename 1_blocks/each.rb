def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])  # yield to the block, passing in the current element to the block
    # does not implement what action to perform when iterating through the array.
    # the trick here is to pass the current element we're working with to the block.
    # return execution back to the while loop after executing the block.
    counter += 1
  end

  array  # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

selected =
  each([1, 2, 3, 4, 5]) do |num|
    puts num + 1
  end.select(&:odd?)

p selected



# each is useful to chain methods since it simply returns the calling object.
# [1, 2, 3].each{|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3]

