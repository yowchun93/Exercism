class Hamming

  # compute
  def self.compute(a, b)  
    if a == '' || b == '' 
      0
    end
    if a.length > b.length || b.length > a.length
      raise ArgumentError
    end
    difference = 0
    a.split('').each_with_index do |letter, i|
      if a[i] != b[i] 
        difference += 1
      end
    end
    return difference
  end

end