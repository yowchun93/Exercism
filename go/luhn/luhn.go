package luhn

import (
	"strconv"
	"strings"
	"unicode"
)

//Valid describes where an input is valid according to Luhn formula
func Valid(input string) bool {
	parsedInput := strings.Replace(input, " ", "", -1)

	if !isValidNumber(parsedInput) {
		return false
	}

	// boolean initialized to false
	var (
		sum              int
		shouldDoubleNext bool
		currentDigit     int
	)

	// iterate backwards
	for i := len(parsedInput) - 1; i >= 0; i-- {
		// convert to int
		currentDigit, _ = strconv.Atoi(string(parsedInput[i]))

		if shouldDoubleNext {
			currentDigit = doubleDigit(currentDigit)
		}
		// add the result to the sum
		sum += currentDigit
		shouldDoubleNext = !shouldDoubleNext
	}
	return sum%10 == 0
}

func isValidNumber(input string) bool {
	if len(input) > 1 && !containNonDigit(input) {
		return true
	}
	return false
}

func containNonDigit(input string) bool {
	for _, c := range input {
		if !unicode.IsDigit(c) {
			return true
		}
	}
	return false
}

func doubleDigit(input int) int {
	result := input * 2
	if result > 9 {
		result -= 9
	}
	return result
}
