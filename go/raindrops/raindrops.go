package raindrops

import "strconv"

// Convert returns
func Convert(number int) string {
	output := ""
	if notDivisible(number) {
		output += strconv.Itoa(number)
	} else {
		if number%3 == 0 {
			output += "Pling"
		}
		if number%5 == 0 {
			output += "Plang"
		}
		if number%7 == 0 {
			output += "Plong"
		}
	}
	return output
}

func notDivisible(number int) bool {
	if number%3 != 0 && number%5 != 0 && number%7 != 0 {
		return true
	}
	return false
}
