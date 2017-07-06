encrypted = File.new('encrypted.txt')

def rot13(char)
  return char.tr('a-m', 'n-z') if ('a'..'m').cover? char
  char.tr('n-z', 'a-m') if ('n'..'z').cover? char
end

decrypted =
  encrypted.map do |line|
    line.chars.map do |char|
      result = rot13(char.downcase) || char
      char.upcase == char ? result.upcase : result
    end
  end.join

print decrypted