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