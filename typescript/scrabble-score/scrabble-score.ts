type Mapping = {
  [key: string]: number;
}

function constructMapping(lettersArray: (string | number)[][]): Mapping {
  const letterMapping: Mapping = {}

  lettersArray.forEach((row) => {
    let [val, ...rest] = row

    rest.forEach((elem) => {
      letterMapping[elem] = val as number
    })
  })
  return letterMapping
}

export default function score(word?: string){
  let   value = 0
  const allLetters = [
    [1, 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'],
    [2, 'D', 'G'],
    [3, 'B', 'C', 'M', 'P'],
    [4, 'F', 'H', 'V', 'W', 'Y'],
    [5, 'K'],
    [8, 'J', 'X'],
    [10, 'Q', 'Z']
  ]
  const mapping = constructMapping(allLetters)

  if (word === '' || word === undefined) {
    return 0
  }

  word.split('').forEach((e) => {
    value += mapping[e.toUpperCase()]
  })
  return value
}