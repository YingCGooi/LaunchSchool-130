# Implement run-length encoding and decoding.

# Run-length encoding (RLE) is a simple form of data compression, where runs (consecutive data elements) are replaced by just one data value and count.

# For example we can represent the original 53 characters with only 13.

# "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"
# RLE allows the original data to be perfectly reconstructed from the compressed data, which makes it a lossless data compression.

# "AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"

class RunLengthEncoding
  def self.encode(input)
    input.scan(/((.)\2*)/)
         .map { |letters, char| [letters.size, char] - [1] }
         .join
  end

  def self.decode(input)
    input.scan(/\d+.|./).map do |number_char|
      letter_count = number_char.scan(/\d+|./).reverse
      letter_count[0] * (letter_count[1]&.to_i || 1)
    end.join
  end
end

# p RunLengthEncoding.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
# p RunLengthEncoding.decode("12WB12W3B24WB")

# p "12WB12W3B24WB".chars.chunk { |x| (0..99).include?(x) }.to_a