// this question is pretty similar to roman numerals
export default class Handshake {
  public num: number;
  public signals: string[];

  constructor(num: number){
    this.num = num
    this.signals = []
  }

  commands() {
    let num = this.num
    let reverseOrder = null

    if (num === 0) {
      return []
    }

    while(num > 0) {
      if (num >= 16) {
        reverseOrder = true
        num = num - 16
      } else if (num >= 8) {
        this.signals.push('jump')
        num = num - 8
      } else if (num >= 4) {
        this.signals.push('close your eyes')
        num = num - 4
      } else if (num >= 2) {
        this.signals.push('double blink')
        num = num - 2
      } else if (num >= 1) {
        this.signals.push('wink')
        num = num - 1
      }
    }

    if (reverseOrder === true) {
      return this.signals.reverse().reverse()
    } else {
      return this.signals.reverse()
    }
  }
}