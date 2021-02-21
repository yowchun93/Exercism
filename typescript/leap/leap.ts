// function isLeapYear( year: number ) {
//   if (year % 400 === 0) {
//     return true
//   } else if (year % 100 !== 0) {
//     return false
//   } else if (year % 4 === 0) {
//     return true
//   }
//   return false
// }

function isLeapYear(year: number) {
  return (year % 4 == 0) && (year % 400 === 0 || year % 100 !== 0);
}

export default isLeapYear