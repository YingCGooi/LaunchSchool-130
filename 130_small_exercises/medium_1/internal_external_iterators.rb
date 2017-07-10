# In this exercise, your task is to create a new Enumerator object. When creating a new Enumerator, you may define what values are iterated upon. We'll want to create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, reset your Enumerator. Finally, reprint those same 7 factorials using your Enumerator object as an "Internal Iterator".

# You can find almost everything you need for this exercise in the documentation for Enumerator. In particular, check out the ::new method; it should prove a good starting point for this exercise. Some further details about internal vs external iterators are mentioned at the start of that documentation, so make sure to read that section. Keep in mind that that section can be a bit dense; if you don't understand everything about it, that's ok.

# The wikipedia page on factorials may also be of some use.

# Two final hints:

# You'll only need 3 Enumerator methods to complete this exercise.
# An Enumerator also implements the Enumerable module. Keep this in mind, as it may make certain parts of this exercise easier to write.

def factorial(num)
  return 1 if num < 1
  (1..num).reduce(:*)
end

factorial_enum =
  Enumerator.new do |x|
    num = 0
    loop do
      x << factorial(num)
      num += 1
    end
  end

p factorial_enum.take(7)

7.times { p factorial_enum.next }
# External iterator

# factorial_enum.rewind

factorial_enum.each_with_index do |number, index|
  puts number
  break if index == 6
end