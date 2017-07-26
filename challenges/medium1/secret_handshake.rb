# Write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those in the "know" when it comes to binary decide to come up with a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump

# 10000 = Reverse the order of the operations in the secret handshake.

# inputs: an integer, or a string digit
# if integer, change it to base 2 value and then dismantle it into 1, 10, 100, 1000 and 10000s
# if string, dismantle it directly
# output: commands correspond to the base 2 values

# data structure: array
# 11001 => [1, 1000, 10000]
# 11101 => [1, 100, 1000, 10000]

COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump', :reverse] # we'll implement reverse later

class SecretHandshake
  def initialize(num)
    num = num[/[^10]/] ? 0 : num
    @digits = num.is_a?(Integer) ? num.to_s(2) : num
  end

  def commands
    commands =
      COMMANDS.map.with_index do |command, idx|
        command if @digits.chars.reverse[idx] == "1"
      end.compact

    commands.last == :reverse ? commands.reverse[1..-1] : commands
  end
end

class SecretHandshake
  COMMANDS = { 1  => -> (arr) { arr << 'wink' },
               2  => -> (arr) { arr << 'double blink' },
               4  => -> (arr) { arr << 'close your eyes' },
               8  => -> (arr) { arr << 'jump' },
               16 => -> (arr) { arr.reverse! } }

  def initialize(num)
    @num = num.is_a?(String) ? (num[/[^01]/] ? 0 : num.to_i(2)) : num
  end

  def commands
    COMMANDS.each_with_object([]) { |(k, v), arr| v.call(arr) if k & @num == k }
  end
end # Nick's solution

p handshake = SecretHandshake.new(9)
p handshake.commands # => ["wink","jump"]

p handshake = SecretHandshake.new("11001")
p handshake.commands # => ["jump","wink"]
# The program should consider strings specifying an invalid binary as the value 0.