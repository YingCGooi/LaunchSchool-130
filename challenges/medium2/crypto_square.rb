# Those 7 rows produce this rectangle when printed one per line:

# ifmanwas
# meanttos
# tayonthe
# groundgo
# dwouldha
# vegivenu
# sroots
# The coded message is obtained by reading down the columns going left to right. For example, the message above is coded as:

# imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau
# Write a program that, given an English text, outputs the encoded version of that text.

# For example, a message 4 characters long should use a 2 x 2 square. A message that is 81 characters long would use a square that is 9 columns wide. A message between 5 and 8 characters long should use a rectangle 3 characters wide.

class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @text.scan(/\w+/).join.downcase
  end

  def size
    (normalize_plaintext.size**0.5).ceil
  end

  def plaintext_segments
    normalize_plaintext.scan(/\w{1,#{size}}/)
  end

  def normalize_ciphertext
    (0...size).map.with_index do |idx|
      plaintext_segments.map { |seg| seg[idx] }.join
    end.join(' ')
  end

  def ciphertext
    normalize_ciphertext.delete(' ')
  end
end


# crypto = Crypto.new('Never vex thine heart with idle woes')
# p crypto.normalize_plaintext.size
# p crypto.size
# p crypto.plaintext_segments

# crypto2 = Crypto.new('Time is an illusion. Lunchtime doubly so.')
# p crypto2.ciphertext
# p crypto2.normalize_ciphertext

crypto3 = Crypto.new('Vampires are people too!')
# p crypto3.normalize_plaintext
p crypto3.plaintext_segments
# p crypto3.size
# p crypto3.ciphertext
p crypto3.normalize_ciphertext

crypto4 = Crypto.new('Madness, and then illumination.')
# p crypto4.plaintext_segments
p crypto4.normalize_ciphertext
# p crypto4.ciphertext