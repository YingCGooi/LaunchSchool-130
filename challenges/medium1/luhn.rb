class Luhn
  def initialize(num)
    @digits = num.digits
  end

  def valid?
    checksum % 10 == 0
  end

  def addends
    @digits.map.with_index do |d, i|
      i.odd? ? (d * 2 > 10 ? d * 2 - 9 : d * 2) : d
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def self.create(num)
    luhn10 = new(num * 10)
    luhn10.valid? ? num * 10 : num * 10 + (10 - luhn10.checksum % 10)
  end
end

# p Luhn.new(12121).addends
# p Luhn.new(8631).addends
# p Luhn.new(4913).checksum
p Luhn.create(123)
p Luhn.create(873_956)
p Luhn.create(8_739_567)