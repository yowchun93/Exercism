interface Nucleotide {
  [key: string]: number;
}

class NucleotideCount {
  static nucleotideCounts(dna: string) {
    const counts: Nucleotide = { A: 0, C: 0, G: 0, T: 0 };

    if (dna === '') {
      return counts
    } else {
      dna.split("").forEach((elem: string) => {
        if (this.validNucleotide(elem)) {
          counts[elem]++
        } else {
          throw new Error('Invalid nucleotide in strand')
        }
      })
      return counts
    }
  }

  static validNucleotide(dna: string): boolean {
    return ['A', 'C', 'G', 'T'].includes(dna)
  }
}

// https://exercism.io/tracks/typescript/exercises/nucleotide-count/solutions/a2bdf85ef66a4506b57b55c8b7531394

export default NucleotideCount
