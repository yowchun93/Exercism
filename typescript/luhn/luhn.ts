export default class Luhn {

  static valid(a: string): boolean {
    if (a.length === 1) {
      return false
    } else if (a === '0') {
      return false
    }
    let luhnTotal = this.luhnAlgorithm(a)

    return ((luhnTotal % 10) === 0)
  }

  static luhnAlgorithm(a: string) {
    let newArr: number[] = []

    a.split('').forEach((elem, index) => {
      if (index % 2 ) {
        let doubled = parseInt(elem) * 2

        if (doubled > 9) {
          newArr.push(doubled - 9)
        } else {
          newArr.push(doubled)
        }
      } else {
        newArr.push(parseInt(elem))
      }
    })
    return newArr.reduce((a, b) => a + b, 0)
  }

  // static luhnAlgorithm(a: string) {
  //   let total = 0

  //   a.split(' ').forEach((row) => {
  //     let [n1, n2, n3, n4] = row
  //     let [a, b] = [0,0]

  //     if (n1 !== undefined) {
  //       a = (parseInt(n1) * 2)
  //     }
  //     if (n3 !== undefined) {
  //       b = parseInt(n3) * 2
  //     }

  //     total += [a, parseInt(n2), b, parseInt(n4)]
  //             .filter(n => n)
  //             .reduce((a, b) => a + b, 0)
  //   })

  //   return total
  // }
}