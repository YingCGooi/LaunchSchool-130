# Build a method that will return the greatest common divider of two positive integers

def gcd(a, b)
  (1..[a, b].min).select { |n| a % n == 0 && b % n == 0 }.max
end

p gcd(9, 15) #=> 3
p gcd(100, 11) #=> 1
p gcd(14, 28)