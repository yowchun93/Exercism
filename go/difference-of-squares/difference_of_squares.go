package diffsquares

// SquareOfSums return square of sum of 10 nature numbers
func SquareOfSums(n int) int {
	accum := 0
	for i := 1; i <= n; i++ {
		accum += i
	}
	return (accum * accum)
}

// SumOfSquares returns sum of squares
func SumOfSquares(n int) int {
	// get from 1 to n
	accum := 0
	for i := 1; i <= n; i++ {
		accum += (i * i)
	}
	return accum
}

// Difference returns the difference of square of sums and sum of squares
func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
