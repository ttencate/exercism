class Acid
  def initialize(nucleotides)
    @nucleotides = nucleotides.to_s.upcase.delete("^#{self.class.valid_nucleotides}")
  end

  def to_s
    @nucleotides
  end

  def to_str
    @nucleotides
  end

  def ==(other)
    to_s == other.to_s
  end

  def self.valid_nucleotides
    'ACG'
  end
end

class RibonucleicAcid < Acid
  def self.valid_nucleotides
    super + 'U'
  end
end

class DeoxyribonucleicAcid < Acid
  def to_rna
    RibonucleicAcid.new(@nucleotides.tr('T', 'U'))
  end

  def self.valid_nucleotides
    super + 'T'
  end
end
