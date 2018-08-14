package luhn

import (
	"fmt"
	"strconv"
	"unicode"
)

//Valid describes where an input is valid according to Luhn formula
func Valid(input string) bool {
	input = normalize(input)
	if len(input) < 2 {
		return false
	}
	sum := sum(input)
	if sum%10 == 0 {
		return true
	}
	return false
}

func normalize(input string) string {
	var normalized string
	for _, i := range input {
		if unicode.IsNumber(i) {
			normalized += string(i)
		}
	}
	return normalized
}

func sum(input string) int {
	numDigits := 0
	sum := 0
	for i := len(input) - 1; 0 <= i; i-- {
		digit, _ := strconv.Atoi(string(input[i]))
		if numDigits%2 == 0 {
			digit = digit * 2
			if digit >= 9 {
				digit -= 9
			}
			sum += digit
		} else {
			sum += digit
		}
		numDigits++
	}
	fmt.Println(sum)
	return sum
}
