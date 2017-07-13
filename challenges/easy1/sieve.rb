# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.

# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).

# The algorithm consists of repeating the following over and over:

# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.

# class Sieve
#   attr_accessor :range

#   def initialize(limit)
#     @range = (2..limit).to_a
#   end

#   # def primes
#   #   result = []
#   #   loop do
#   #     target = range.shift
#   #     result << target
#   #     self.range = range.reject { |num| num % target == 0 }
#   #     break if range.empty?
#   #   end
#   #   result
#   # end

#   def primes
#     raise ArgumentError if @limit < 2
#     range.each do |target|
#       range.reject! { |num| num != target && num % target == 0 }
#     end
#   end
# end


class Sieve
  def initialize(limit)
    @limit = limit
    @nums = (2..limit).map { |n| [n, true] }.to_h
  end

  def primes
    @nums.each { |num, prime| mark_multiples(num) if prime }.to_h
         .compact.keys
  end

  private

  def mark_multiples(num)
    (num * 2).step(@limit, num).each { |multiple| @nums[multiple] = nil }
  end
end

# test:
require 'prime'

def benchmark
  start_time = Time.now
  yield
  puts "Seconds: #{Time.now - start_time}"
end

p Sieve.new(1000).primes
benchmark { p Sieve.new(1_000_000).primes == Prime.entries(1_000_000) }
# 'true', 'Seconds: ~1.6'
