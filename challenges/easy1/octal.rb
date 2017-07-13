# Implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

# Note:

# Implement the conversion yourself. Do not use something else to perform the conversion for you. Treat invalid input as octal 0.

# About Octal (Base-8):

# Decimal is a base-10 system.

# A number 233 in base 10 notation can be understood as a linear combination of powers of 10:

# The rightmost digit gets multiplied by 100 = 1
# The next number gets multiplied by 101 = 10
# ...
# The n*th number gets multiplied by 10n-1*.
# All these values are summed.

# class Octal
#   attr_reader :digits

#   def initialize(num_str)
#     num_str.match?(/[^0-7]/) ? '0' : num_str
#     @digits = num_str.chars.map(&:to_i)
#   end

#   def to_decimal
#     return 0 if @num_str =~ /[^0-7]/

#     digits.reverse
#           .map.with_index { |digit, idx| digit * (8**idx) }
#           .reduce(:+)
#   end
# end

class Octal
  def initialize(num)
    @num = num.match?(/[^0-7]/) ? '0' : num
  end

  def to_decimal
    @num.chars.reduce(0) { |sum, n| n.to_i + sum * 8 }
  end
end

p Octal.new('10').to_decimal