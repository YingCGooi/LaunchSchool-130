# Write a program that cleans up user-entered phone numbers so that they can be sent as SMS messages.

# The rules are as follows:

# If the phone number is less than 10 digits assume that it is bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number

class PhoneNumber
  attr_reader :phone_num, :digits, :after_digits

  def initialize(phone_num)
    @phone_num = phone_num
    @digits = phone_num.scan(/\d/)
    @after_digits = @digits.reverse.take(10).reverse.join
  end

  def number
    return '0000000000' if invalid_number?
    after_digits
  end

  def invalid_number?
    digits.count == 11 && digits[0] != '1' ||
    !(10..11).cover?(digits.count) ||
    phone_num[/[a-z]/i]
  end

  def area_code
    after_digits[0, 3]
  end

  def to_s
    num = after_digits
    "(#{area_code}) #{num[3, 3]}-#{num[6, 4]}"
  end
end

p PhoneNumber.new('123456789').number
p PhoneNumber.new('(987) 654-3210').number
p PhoneNumber.new('19876543210').number