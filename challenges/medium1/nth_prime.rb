# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# Do not use Ruby's Prime class nor any of the prime-number testing methods in the Integer class. For an algorithm to determine whether a number is prime, check out this article.

# 2
# and 37 is not even, so 2 is not a factor of 37
# 3
# and 37/3 is 12.3333 so 3 does not divide exactly into 37 either
# 5
# and 37 does not end with 0 or 5 so 5 is not a factor of 37
# 7 is the next prime,
# but it is bigger than the square-root of 36, so we can stop now.
# So 37 has no factors (except 1 and 37 of course) and therefore
# 37 is a prime number.

class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    primes = [2]
    current_prime = 3
    current_count = 2

    loop do
      break primes.last if primes.size >= n
      primes << current_prime if prime?(primes, current_prime)
      current_prime += 2
      current_count += 1
    end
  end

  def self.prime?(primes, current_prime)
  # test to see if numbers less than square root of current_prime are prime
    primes.take_while do |prime|
      break false if current_prime % prime == 0
      prime <= (current_prime**0.5)
    end
  end
end

p Prime.nth(6)