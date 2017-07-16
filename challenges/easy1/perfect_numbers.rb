# A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if !num.is_a?(Integer) || num < 0
    sum_factors = (1..num/2).select { |factor| num % factor == 0 }.reduce(:+)
    %w[perfect abundant deficient][sum_factors <=> num]
  end
end
