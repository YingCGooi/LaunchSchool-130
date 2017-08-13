# Write a program that can detect palindrPome products in a given range.

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers (range 10 ~ 99) is 9009 = 91 x 99.

class Palindromes
  def initialize(opt)
    @min = opt[:min_factor] || 1
    @max = opt[:max_factor] || 1
  end

  def generate
    @palindromes =
      (@min*@min..@max*@max).select do |num|
        num.to_s.reverse == num.to_s
      end
  end

  def largest
    largest_palindrome_factors =
      @palindromes.reverse.each do |palindrome|
        factors = (@max.downto(@min)).map do |factor|
          factors = [factor, palindrome / factor]
          factors if palindrome % factor == 0 && factors.max <= @max
        end.compact
        break [palindrome, factors] if !factors.empty?
      end

    Factors.new(largest_palindrome_factors)
  end

  def smallest
    smallest_palindrome_factors =
      @palindromes.each do |palindrome|
        factors =
          (@min..@max).map do |factor1|
            factor2 = palindrome / factor1
            [factor1, factor2] if palindrome % factor1 == 0 && [factor1, factor2].min >= @min
          end.compact
        break [palindrome, factors] if !factors.empty?
      end

    Factors.new(smallest_palindrome_factors)
  end
end

class Factors
  def initialize(arr)
    @palindrome_factors = arr
  end

  def value
    @palindrome_factors[0]
  end

  def factors
    @palindrome_factors[1].map(&:sort).uniq
  end
end


p palin = Palindromes.new(max_factor: 99, min_factor: 10)
p palin.generate
p palin.largest
p palin.largest.value
p palin.largest.factors
puts "==========="
# p palin.smallest
# p palin.smallest.value
# p palin.smallest.factors
