package hamming

import (
	"errors"
)

// Distance returns  difference in size between 2 DNA strands
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("dna strands must be of same length")
	}
	count := difference(a, b)
	return count, nil
}

func difference(a string, b string) int {
	diffCount := 0
	for i := range a {
		if b[i] != a[i] {
			diffCount++
		}
	}
	return diffCount
}
