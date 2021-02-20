type Nucletide = 'G' | 'C' | 'A' | 'T'

class Transcriptor {
  dnaRnaMap: {[Nucleotide: string]: string} = {
    C: 'G', G: 'C', A: 'U', T: 'A'
  }

  toRna(dna: string): string {
    return dna.split('').map((a) => {
      return (this.dnaRnaMap[a as Nucletide] || this.throwError())
    }).join('')
  }

  throwError() {
    throw Error("Invalid input DNA.")
  }
}

export default Transcriptor
