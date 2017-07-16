# Write a program that, given a word, computes the scrabble score for that word.

# Letter Values

# You'll need these:

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

class Scrabble
  SCORES = { "AEIOULNRST" => 1, "DG" => 2, "BCMP" => 3, "FHVWY" => 4, "K" => 5, "JX" => 8, "QZ" => 10 }

  def initialize(word)
    @word = word
  end

  def score
    @word.to_s.chars.reduce(0) do |sum, char|
      sum + corresponding_score(char)
    end
  end

  def corresponding_score(char)
    SCORES.select { |letters, _| letters.include?(char.upcase) }.values[0].to_i
  end

  def self.score(word)
    new(word).score
  end
end

p Scrabble.new(" \t\n").score
p Scrabble.new('street').score
p Scrabble.new(nil)