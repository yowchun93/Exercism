package isogram

import (
	"unicode"
)

// IsIsogram check whether an input is an isoGram
// ignoring non alphabets
func IsIsogram(input string) bool {
	wordExists := make(map[rune]bool)
	for _, char := range input {
		lowerChar := unicode.ToLower(char)
		if unicode.IsLetter(lowerChar) {
			if _, present := wordExists[lowerChar]; present {
				return false
			}
			wordExists[lowerChar] = true
		}
	}
	return true
}
