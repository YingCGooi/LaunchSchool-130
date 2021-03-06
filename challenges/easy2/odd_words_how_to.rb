# resist the urge to dive into code
# read the desc 3 times produce an outline if necessary
# communicate/ clarify # if there is ambiguity
# have a plan - algo, and verify with that
# test cases (edges cases) happy paths are most obvious test cases
# fail paths are test cases which will raise errors
# abstraction - part of the solution is isolated from the problem

# Consider a character set consisting of letters, a space, and a point.
# Ex. 'ABCdef', ' ', '.'

# Words consists of one or more, but at most 20 letters.
# word.size in between (1..20)

# An input text consists of one or more words separated from each other by one or more spaces and terminated by 0 or more spaces followed by a point.
# 'word1 Word2   word3      woORD4.'
# 'word1 word2   word3    .'
# '   .' - invalid need at least one word
# 'word1    ' -invalid need one point
# 'word1  word2 word3 .....' -invalid since more than one point

# Input should be read from and including the first letter of the first word, upto and including the terminating point.
# '   word1.'  should be read from 'w'

# The output text is to be produced such that successive words are separated by a single space with the last word being terminated by a single point.
# 'word1 Word2   word3      woORD4.' => 'word1 Word2 word3 woORD4.'
# 'word1 word2   word3    .' => 'word1 word2 word3.'

# Odd words are copied in reverse order while even words are merely echoed.

# chars: letter, space, point
#  - any invalid inputs? ([]//??) ask the question
#  - ""
#  - "."
#  - "   ."

# words: 1-20 letters
#   - more than 20 letters
# input:
#  1 - * words,
#  separated by 1 - * spaces
# terminated: 0 - * space, followed by a point
# words
# output:
#  - words: have the odd words reversed
#  - separated by 1 space
#  - terminated: 0 space, followed by a point

def invalid?(str)
  str.scan(/\w+|\./).any? { |word| !(1..20).cover?(word.size) } ||
  str.empty? ||
  str.delete('.').empty?
end

def odd_reverse(str)
  str.strip!
  return "INVALID" if invalid?(str)
  str.scan(/\w+|\./).map.with_index do |word, idx|
    idx.odd? ? word.reverse : word
  end.join(' ').gsub(' .', '.')
end

def odd_words(str)
  return '' if str.empty?
  str.delete('.').squeeze(' ').strip.gsub(/(\w+) (\w+)/) { "#{$1} #{$2.reverse}" } + '.'
end

def odd_reverse(str)
  result = ''
  odd_word = false
  space_added = false
  last_letter_idx = 0
  result_space_idx = 0
  result_word_idx = 0

  str.chars.each_with_index do |char, idx|
    p [idx, last_letter_idx, 'rs' + result_space_idx.to_s, 'rw' + result_word_idx.to_s, result]
    case char
    when 'A'..'Z', 'a'..'z', '0'..'9'
      last_letter_idx = idx
      result_word_idx += 1
      next if result_word_idx - result_space_idx >= 20
      if !odd_word || space_added
        result << char
        space_added = false
      else
        result.insert(result_space_idx + 1, char)
      end
    when ' '
      if idx - last_letter_idx == 1
        result << char
        odd_word = !odd_word
        space_added = true
        result_space_idx = result.size - 1
      end
    when '.'

    end
    p [idx, last_letter_idx, 'rs' + result_space_idx.to_s, 'rw' + result_word_idx.to_s, result]
  end
  result[-1] == ' ' ? result[-1] = '.' : result << '.'
  result
end

# 'hi    moving   thisisaverylongwordshouldbeinvalid word2.'
# 012345678901234567890123456789012345678901234567890123456
#           1         2         3         4

# "hi gnivom thisisaverylongwordshouldbeinvalid 2drow."
#  012345678901234567890123456789012345678901234567890
#            1         2         3         4         5

# 'word1 Word2   word3      woORD4.'
#  01234567890123456789012345678901
#            1         2         3

# 'word1 2droW word3 4DROow.'
#  0123456789012345678901234
#            1         2

# 'word1 word2   word3    .     '
#  012345678901234567890234
#            1         2

p odd_reverse("whats the matter with kansas.") #== "whats eht matter htiw kansas."
p odd_reverse('word1 Word2   word3      woORD4   word5.') #== 'word1 2droW word3 4DROow.'
p odd_reverse('word1 word2   word3    .') #== 'word1 2drow word3.'/
# p odd_reverse('.') # raise ArgumentError
# p odd_reverse('') # raise ArgumentError
# p odd_reverse('word1') # raise ArgumentError
p odd_reverse('hi    moving   thisisaverylongwordshouldbeinvalid word2.') # "hi gnivom thisisaverylongwordshouldbeinvalid 2drow."
