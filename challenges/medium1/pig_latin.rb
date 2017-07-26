# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below), but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.

# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
# There are a few more rules for edge cases, and there are regional variants too.

# chair => air + ch + ay
# queen => een + qu + ay # u is consonant sound
# square => are + squ + ay # u is consonant sound
# u is consonant sound if the letter after it is a vowel
# therapy => erapy + th + ay
# thrush => ush + thr + ay
# school => ool + sch + ay
# quick fast run => ick+qu+ay ast+f+ay un+r+ay
# yellow => ellow + y + ay
# y is consonant sound if the letter after it is a vowel
# yttria => yttria + ay
# y is vowel sound if the letter after it is a consonant
# xenon => enon + x + ay
# xray => xray + ay
# x is a vowel sound if the letter after it is a consonant
# umbrella => umbrella + ay
# u is a vowel sound if the letter after it is a consonant

# input a word or a phrase
# if it is a phrase, split it into words
# for each word, split between the beginning consonants and vowel
# edge cases:
# u, y, x => they are consonants if their next letter is a vowel; vowels if their next letter is a consonant

class PigLatin
  def self.translate(phrase)
    words = phrase.split
    words.map { |word| piggify(word) }.join(' ')
  end

  def self.piggify(word)
    pattern =
      word[/u[aeiou]+/i] ? /\w+u|\w+/ : /\A[xy][^aeiou]+\w+|\A[^aeiou]+|\w+/i

    word.scan(pattern).reverse.join + 'ay'
  end
end


p PigLatin.translate("apple")
p PigLatin.translate("ear")
p PigLatin.translate("pig")
p PigLatin.translate("koala")
p PigLatin.translate("chair")
p PigLatin.translate("queen")
p PigLatin.translate("square")
p PigLatin.translate("therapy")
p PigLatin.translate("thrush")
p PigLatin.translate("school")
p PigLatin.translate("quick fast run")
p PigLatin.translate("yellow")
p PigLatin.translate("xenon")
p PigLatin.translate("yttria")
p PigLatin.translate("xray")
p PigLatin.translate("umbrella")
p PigLatin.translate("xylophone")




