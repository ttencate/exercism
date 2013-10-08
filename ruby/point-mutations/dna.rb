class DNA
  attr_reader :nucleotides

  def initialize(nucls)
    @nucleotides = nucls.chars.to_a
  end

  def hamming_distance(nucls)
    other = DNA.new(nucls)
    shortest, longest = *[self, other].sort.map(&:nucleotides)
    shortest.zip(longest).count { |p| p[0] != p[1] }
  end

  def <=>(other)
    self.nucleotides.length <=> other.nucleotides.length
  end
end
