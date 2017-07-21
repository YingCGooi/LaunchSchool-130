# Write a program that can generate the lyrics of the 99 bottle bear song. See the test suite for the entire song.

# start from number 99
# end with 0
# if 0, lyrics starts with 'No more'
# if 1, 'bottles' become 'bottle'
# loop from 99 to 0
# print lines
# give conditions if line reaches 1 or 0

class BeerSong
  def initialize
   @song =
    99.downto(0).map do |num|
      "#{result_bottles(num).capitalize} of beer on the wall, #{result_bottles(num)} of beer.\n" +
      ("Take #{it_one(num)} down and pass it around, #{result_bottles(num - 1)} of beer on the wall.\n\n" if num > 0).to_s
    end

    @song.last <<
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n\n"

    @song
  end

  def lyrics
    @song.join.chomp
  end

  def result_bottles(num)
    return "#{num} bottles" if num >= 2
    ['no more bottles', '1 bottle'][num]
  end

  def it_one(num)
    return "one" if num >= 2
    "it"
  end

  def verses(num1, num2)
    min, max = [99 - num2, 99 - num1].sort
    @song[min..max].join.chomp
  end

  def verse(num)
    @song[99 - num].chomp
  end
end

p BeerSong.new.lyrics
p BeerSong.new.verse(0)
# puts BeerSong.new.verses(2, 0)
puts BeerSong.new.verses(99, 98)