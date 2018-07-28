package bob

import (
	"strings"
	"unicode"
)

func Hey(newRemark string) string {
	remark := strings.TrimSpace(newRemark)
	if isShoutingQues(remark) {
		return "Calm down, I know what I'm doing!"
	} else if isShouting(remark) {
		return "Whoa, chill out!"
	} else if isQues(remark) {
		return "Sure."
	} else if isSilence(remark) {
		return "Fine. Be that way!"
	} else {
		return "Whatever."
	}
}

func isUpper(remark string) bool {
	return (strings.ToUpper(remark) == remark)
}

// fails for prolonged silence
// can be solved by TrimSpace
func isSilence(remark string) bool {
	return remark == ""
}

func isNumeric(remark string) bool {
	for _, c := range remark {
		if !unicode.IsDigit(c) {
			return false
		}
	}
	return true
}

func hasLetters(remark string) bool {
	return strings.IndexFunc(remark, unicode.IsLetter) >= 0
}

func isQues(remark string) bool {
	return strings.HasSuffix(remark, "?")
}

func isShouting(remark string) bool {
	return isUpper(remark) && hasLetters(remark)
}

func isShoutingQues(remark string) bool {
	return isUpper(remark) && isQues(remark) && hasLetters(remark)
}
