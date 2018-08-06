package isogram

import (
	"strings"
	"unicode"
)

// IsIsogram check whether an input is an isoGram
// ignoring non alphabets
func IsIsogram(input string) bool {
	wordExists := make(map[rune]bool)
	for _, char := range strings.ToLower(input) {
		if unicode.IsLetter(char) {
			if _, present := wordExists[char]; present {
				return false
			}
			wordExists[char] = true
		}
	}
	return true
}
