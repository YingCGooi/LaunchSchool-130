# Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

# initialization: take multiples as arguments
# input on #to method: limit that the multiple will reach
# output, sum of all multiples up to that limit
# if no args in initialization, use 3 and 5

class SumOfMultiples
  def initialize(*multiples)
    raise ArgumentError, "cannot input a negative number" if multiples.min < 0
    @multiples = multiples
  end

  def self.to(limit)
    new(3, 5).to(limit) # new returns a SumOfMultiples object
  end

  def to(limit)
    return 0 if limit < @multiples.min
    @multiples.flat_map { |mult| (mult...limit).step(mult).to_a }
              .uniq
              .reduce(:+)
  end
end

p SumOfMultiples.to(100000)



