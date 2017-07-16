# This is called the 'Hamming distance'

# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^ Hamming distance is 7

# inputs: two strands of same or different lengths
# process: truncate the additional nucleotides, leaving the pattern with the most matches
# output: return the number of mismatches

# strand   = 'GAGCCTACTAACGGGAT'
# distance = 'GCATCGTAATGACGGCCT'

# hamming_dists =
#   (0..distance.size - strand.size).map do |start_idx|
#     strand.chars.each_with_index.count do |char, idx|
#       char != distance[start_idx, strand.size][idx]
#     end
#   end

# p hamming_dists.min

# class DNA
#   def initialize(strand)
#     @strand = strand
#   end

#   def hamming_distance(dist)
#     raise(ArgumentError, "invalid input") if @strand + dist =~ /[^GCAT]/
#     shorter, longer = [@strand, dist].sort_by(&:size)
#     shorter.chars.each_with_index.count { |char, idx| char != longer[idx] }
# end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    raise(ArgumentError, "invalid") if @strand + other =~ /[^GCAT]/
    @strand.chars.zip(other.chars).count { |x, y| x != y && !y.nil? }
  end
end

strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
dist = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'

p DNA.new('GGACGGATTCTGACCTGGACTAATTTTGGGG').hamming_distance('AGGACGGATTCTGACCTGGACTAATTTTGGGG')
p DNA.new('ACT').hamming_distance('GGA')
