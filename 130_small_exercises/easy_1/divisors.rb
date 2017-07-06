# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

# Examples

# def divisors(input_num)
#   result =
#     (1..input_num / 2).select do |num|
#       input_num % num == 0
#     end
#   result << input_num
# end

def divisors(num)
  (1..num**0.5).flat_map { |n| [n, num / n] if (num % n).zero? } #.compact.uniq.sort
end

p divisors(1) #== [1]
p divisors(7) #== [1, 7]
p divisors(12) #== [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) #== [1, 9967, 9973, 99400891] # may take a min
p divisors(999962000357)