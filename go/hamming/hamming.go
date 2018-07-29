package hamming

import (
	"errors"
	"strings"
)

// Distance returns is difference in size between 2 DNA strands
func Distance(a, b string) (int, error) {

	slice1 := strings.Split(a, "")
	slice2 := strings.Split(b, "")

	if len(slice1) != len(slice2) {
		return -1, errors.New("dna strands must be of same length")
	}

	count := difference(slice1, slice2)

	return count, nil
}

func difference(slice1 []string, slice2 []string) int {
	diffCount := 0
	for i := range slice1 {
		if slice2[i] != slice1[i] {
			diffCount++
		}
	}
	return diffCount
}
