# valid inputs 0-9 A-F (0-16 in decimal)
# return 0 if invalid

HEX_VALUES = [*'0'..'9', *'A'..'F']

class Hex
  def initialize(num_str)
    @digits_str = num_str[/[^0-9A-F]/i] ? '0' : num_str.upcase
  end

  def to_decimal
    @digits_str.chars.reduce(0) { |sum, n| HEX_VALUES.index(n) + sum*16 }
  end
end