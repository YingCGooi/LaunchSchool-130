# Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

# For example, the string "01234" has the following 3-digit series:

# - 012
# - 123
# - 234
# And the following 4-digit series:

# - 0123
# - 1234
# And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.

class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits.each_char.map(&:to_i)
  end

  def slices(num)
    return '' if num == 0
    raise ArgumentError, 'n exceeds the size of input' if num > digits.size
    digits.each_cons(num).to_a
  end
end