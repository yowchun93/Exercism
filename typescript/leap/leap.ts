function isLeapYear( year: number ) {
  if (year % 400 == 0) {
    return true
  } else if (year % 100) {
    return false
  } else if (year % 4) {
    return true
  }
  return false
}

export default isLeapYear