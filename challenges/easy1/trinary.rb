# Write a program that will convert a trinary number, represented as a string (e.g. '102012'), to its decimal equivalent using first principles (without using an existing method or library that can work with numeral systems).

# Trinary numbers can only contain three symbols: 0, 1, and 2. Invalid trinary entries should convert to decimal number 0.

# The last place in a trinary number is the 1's place. The second to last is the 3's place, the third to last is the 9's place, etc.

# # "102012"
#     1       0       2       0       1       2    # the number
# 1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2 =  302
#     1
#     3       0
#     9       0       2
#    27       0       6       0
#    81       0      18       0       1
#   243       0      54       0       3       2

# check input: valid numbers are 0,1,2, other characters are invalid, output 0 if invalid
# reversed transformation starting from the idx = 0, up to idx = (size - 1)
# each iteration, multiply number by 3^idx

class Trinary
  def initialize(num_str)
    @digits = num_str[/[^012]/] ? [0] : num_str.to_i.digits
  end

  def to_decimal
    @digits.map
           .with_index { |digit, idx| digit * (3**idx) }
           .reduce(0, :+)
    # @digits.chars.reduce(0) { |sum, n| n.to_i + sum * 3 }
  end
end

