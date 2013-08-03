class RibonucleicAcid < String
  def initialize(nucleotides)
    super(nucleotides.to_s.gsub(/[^ACUG]/, ''))
  end
end

class DeoxyribonucleicAcid < String
  def initialize(nucleotides)
    super(nucleotides.to_s.gsub(/[^ACTG]/, ''))
  end

  def to_rna
    RibonucleicAcid.new(gsub(/T/, 'U'))
  end
end
