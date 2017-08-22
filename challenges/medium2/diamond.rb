# The diamond exercise takes as its input a char, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# Requirements

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# Input: the letter that will be the on the widest ends
# Output: string

# Diamond for letter 'E':

#     A
#    B B
#   C   C
#  D     D
# E       E
#  D     D
#   C   C
#    B B
#     A
# ['ssssAssss', 'BsB', 'CsssC', 'DsssssD', 'EsssssssE',
# 'DsssssD', ...]
# [1, 3, 5, 7]
# (0, 1, 2, 3)
# sizes
# A => 1 || 1
# B => 3 || 2
# C => 5 || 3
# D => 7 || 4
# E => 9 || 5

class Diamond
  def self.make_diamond(widest_char)
    max_width = ('A'..widest_char).to_a.size * 2 - 1

    space_formatted =
      ['A'.center(max_width)] +
      ('B'..widest_char).map.with_index do |char, idx|
        "#{char}#{' '*(idx*2 + 1)}#{char}".center(max_width)
      end

    [space_formatted, space_formatted.reverse.drop(1)].join("\n") + "\n"
  end
end

puts Diamond.make_diamond('E')
p Diamond.make_diamond('A')
p Diamond.make_diamond('C')

# p "  A  \n B B \nC   C\n B B \n  A  \n" ==
# "  A  \n B B \nC   C\n B B \n  A  \n"