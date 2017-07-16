#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

class Integer
  ROMANS = {1=>"I", 5=>"V", 10=>"X", 50=>"L", 100=>"C", 500=>"D", 1000=>"M"}
  CONVERSIONS = [
    [], [1], [1, 1], [1, 1, 1], [1, 5], [5],
    [5, 1], [5, 1, 1], [5, 1, 1, 1], [1, 10]
  ]

  def to_roman
    digits = self.to_s.chars.map(&:to_i)
    idx_size = digits.size - 1

    digits.map.with_index do |digit, idx|
      CONVERSIONS[digit].map do |roman_digit|
        ROMANS[roman_digit * 10**(idx_size - idx)]
      end
    end.join
  end
end

class Integer
  ROMAN_N = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50,   XL: 40,  X: 10,  IX: 9,   V: 5,   IV: 4, I: 1 }

  def to_roman(num = self)
    ROMAN_N.map { |k, v| (n, num = num.divmod(v)) && k.to_s * n }.join
  end
end

# p 27.to_roman
p 1024.to_roman

# p 3001.to_roman