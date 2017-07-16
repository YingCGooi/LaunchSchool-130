# Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.

# input for initialize: a word
# input for #match: an array
# output: return an array with matching anagrams
# case insensitive

class Anagram
  def initialize(str)
    @str = str.downcase
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  private

  def anagram?(word)
    word.downcase.chars.sort == @str.chars.sort &&
    word.downcase != @str
  end

# def anagram?(word)
#   @str.casecmp(word).nonzero? &&
#   [@str, word].map(&sort_chars).uniq.size == 1
# end

# def sort_chars
#   -> (word) { word.downcase.chars.sort }
# end
end
