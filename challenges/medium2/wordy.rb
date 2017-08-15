# Write a program that takes a word problem and returns the answer as an integer.

# E.g.

# What is 5 plus 13?
# The program should return 18.

# What is 7 minus 5 minus 1?
# The program should return 1.

# Remember, that these are verbal word problems, not treated as you normally would treat a written problem. This means that you calculate as you move forward each step. This means 3 + 2 * 3 = 15, not 9.

# Input: String
# What is -12 divided by 2 divided by -3?
# Initialize a hash to map operator words to operator symbols. { 'plus' => :+ }
# Format it as [-12, 2, -3], [:/, :/]
# Iterate through each number, using #reduce
# the first number is accumulator, skip first iteration
# invoke #send method on the accumulator, passing in the next operator method and next number as argument.
# repeat until final operation is performed, return the accumulator value

class WordProblem
  PATTERN = /-?\d+|plus|minus|multiplied|divided/
  TO_OPERATIONS = { "plus" => :+, "minus" => :-,
                    "multiplied" => :*, "divided" => :/ }

  def initialize(word_problem)
    raise ArgumentError if !valid(word_problem)

    @math_exp =
      word_problem.scan(PATTERN)
                  .map { |word| TO_OPERATIONS[word] || word.to_i }
  end

  def valid(word_problem)
    word_problem[/-?\d+\s(plus|minus|multiplied by|divided by)\s-?\d+/]
  end

  def answer
    @math_exp.each do
      @math_exp[0, 3] = @math_exp[0].send(@math_exp[1], @math_exp[2])
    end.first
  end
end

# p WordProblem.new('What is 1 plus 1 plus 1?').answer
# p WordProblem.new('What is 33 divided by -3?').answer
# p WordProblem.new('What is -3 multiplied by 25?').answer
# p WordProblem.new('5 divided by 4 6')
# p WordProblem.new('divided 45 multiplied').answer
# p WordProblem.new('hello 45')
