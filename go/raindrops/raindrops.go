package raindrops

import "strconv"

var translations = map[int]string{
	3: "Pling",
	5: "Plang",
	7: "Plong",
}

// Convert converts a number to string, depending on the numbers factor
func Convert(number int) string {
	output := ""
	for key, value := range translation {
		if number%key == 0 {
			output += value
		}
	}
	if output == "" {
		output += strconv.Itoa(number)
	}
	return output
}
