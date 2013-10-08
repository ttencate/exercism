class DNA
  def initialize(nucleotides)
    raise ArgumentError unless nucleotides.chars.all? { |c| dna_nucleotide?(c) }
    @nucleotides = nucleotides
  end

  def nucleotide_counts
    @nucleotides.chars.each_with_object(zero_counts) do |nucleotide, counts|
      counts[nucleotide] += 1
    end
  end

  def count(nucl)
    raise ArgumentError unless dna_or_rna_nucleotide?(nucl)
    nucleotide_counts[nucl] || 0
  end

  private

  DNA_NUCLEOTIDES = 'ACGT'.chars
  RNA_NUCLEOTIDES = 'ACGU'.chars

  def zero_counts
    Hash[DNA_NUCLEOTIDES.map { |nucl| [nucl, 0] }]
  end

  def dna_nucleotide?(nucl)
    DNA_NUCLEOTIDES.include?(nucl)
  end

  def rna_nucleotide?(nucl)
    RNA_NUCLEOTIDES.include?(nucl)
  end

  def dna_or_rna_nucleotide?(nucl)
    dna_nucleotide?(nucl) || rna_nucleotide?(nucl)
  end
end
