class DNA
  DNA_NUCLEOTIDES = %w(A C G T)

  def initialize(nucleotides)
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

  def zero_counts
    DNA_NUCLEOTIDES.each_with_object({}) do |nucleotide, counts|
      counts[nucleotide] = 0
    end
  end

  def nucleotide?(nucl)
    DNA_NUCLEOTIDES.include?(nucl) || nucl == 'U'
  end
end
