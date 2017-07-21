# Write a program that can generate the lyrics of the 99 bottle bear song. See the test suite for the entire song.

class ZeroVerse
  def self.verse(_)
    "No more bottles of beer on the wall, no more bottles of beer.\n"\
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n\n"
  end
end

class OneVerse
  def self.verse(_)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n\n"
  end
end

class TwoVerse
  def self.verse(_)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n\n"
  end
end

class DefaultVerse
  def self.verse(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n\n"
  end
end

class BeerSong
  VERSE_CLASSES = [ZeroVerse, OneVerse, TwoVerse].freeze

  def initialize
    @song =
      99.downto(0).map do |num|
        verse_class = VERSE_CLASSES.fetch(num, DefaultVerse)
        verse_class.verse(num)
      end
  end

  def lyrics
    @song
  end

  def verse(number)
    @song[99 - number]
  end

  def verses(num1, num2)
    @song[99 - num2, 99 - num1]
  end
end

# puts BeerSong.new.lyrics
# puts BeerSong.new.verse(2)
puts BeerSong.new.verses(2, 0)
# puts BeerSong.new.verses(99, 98)