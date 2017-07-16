# For example, if we count the words for the input "olly olly in come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

class Phrase
  def initialize(str)
    @words = str.downcase.scan(/\w+'\w|\w+/)
  end

  def word_count
    @words.each_with_object({}) do |word, hsh|
      hsh[word] = @words.count(word)
    end
  end
end

def split_scan(str)
  str.downcase.scan(/\w+'\w|\w+/)
end

p split_scan('one,two,three')
p split_scan("Joe can't tell between 'large' and large.")
p split_scan('car : carpet as java : javascript!!&@$%^&')
