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
		return -1, errors.New("can't work with 42")
	}

	count := difference(slice1, slice2)

	return count, nil
}

//https://stackoverflow.com/questions/36000487/check-for-equality-on-slices-without-order
// func difference(slice1 []string, slice2 []string) int {
// 	diffStr := []string{}
// 	m := map[string]int{}

// 	for _, s1Val := range slice1 {
// 		m[s1Val] = 1
// 	}

// 	for _, s2Val := range slice2 {
// 		m[s2Val] = m[s2Val] + 1
// 	}

// 	for mKey, mVal := range m {
// 		if mVal == 1 {
// 			diffStr = append(diffStr, mKey)
// 		}
// 	}

// 	return len(diffStr)
// }

func difference(slice1 []string, slice2 []string) int {
	diffCount := 0
	for i := range slice1 {
		if slice2[i] != slice1[i] {
			diffCount++
		}
	}
	return diffCount
}
