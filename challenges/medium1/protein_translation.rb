# Below are the codons and resulting Amino Acids needed for the exercise.

# Codon Protein
# AUG Methionine
# UUU, UUC  Phenylalanine
# UUA, UUG  Leucine
# UCU, UCC, UCA, UCG  Serine
# UAU, UAC  Tyrosine
# UGU, UGC  Cysteine
# UGG Tryptophan
# UAA, UAG, UGA STOP

# #of_codon method returns a single string. The string is simply the protein corresponding to the codon, or STOP if corresponding codon is UAA, UAG, or UGA

# #of_rna method returns an array. The array contains the protein sequence that corresponds to the strand's codons. If there is a STOP codon, the remaining of the strand from the STOP is truncated.

class InvalidCodonError < StandardError; end

class Translation
  CODONS = {
    %w[AUG]             => "Methionine",
    %w[UUU UUC]         => "Phenylalanine",
    %w[UUA UUG]         => "Leucine",
    %w[UCU UCC UCA UCG] => "Serine",
    %w[UAU UAC]         => "Tyrosine",
    %w[UGU UGC]         => "Cysteine",
    %w[UGG]             => "Tryptophan",
    %w[UAA UAG UGA]     => "STOP"
  }

  def self.of_codon(codon)
    CODONS.find { |codons, _| codons.include? codon }
         &.last || raise(InvalidCodonError.new)
  end

  def self.of_rna(strand)
    strand.chars.each_slice(3).map(&:join)
          .map { |codon| of_codon(codon) }
          .take_while { |codon| codon != "STOP" }
  end
end

p Translation.of_codon('AUG')
p Translation.of_codon('UUU')
p Translation.of_codon('UUC')
p Translation.of_codon('UUA')
p Translation.of_codon('UUG')
p Translation.of_codon('UCC')
p Translation.of_rna('AUGUUUUGG')
p Translation.of_rna('AUGUUUUAA')
p Translation.of_rna('UGGUGUUAUUAAUGGUUU')
# p Translation.of_codon('CARROT')
# p Translation.of_rna('CARROT')