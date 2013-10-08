class DNA
  def initialize(nucleotides)
    raise ArgumentError unless nucleotides.chars.all? {|c| dna_nucleotide?(c)}
    @nucleotides = nucleotides
  end

  def nucleotide_counts
    @nucleotides.chars.each_with_object(zero_counts) do |nucleotide, counts|
      counts[nucleotide] += 1
    end
  end

  def count(nucl)
    raise ArgumentError if !nucleotide?(nucl)
    nucleotide_counts[nucl] || 0
  end

  private

  DNA_NUCLEOTIDES = 'ACGT'.chars

  def zero_counts
    DNA_NUCLEOTIDES.each_with_object({}) do |nucleotide, counts|
      counts[nucleotide] = 0
    end
  end

  def dna_nucleotide?(nucl)
    DNA_NUCLEOTIDES.include?(nucl)
  end

  def nucleotide?(nucl)
    dna_nucleotide?(nucl) || nucl == 'U'
  end
end
