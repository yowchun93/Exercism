package grains

import (
	"errors"
	"math"
)

// Square returns
func Square(i int) (uint64, error) {
	if i < 1 || i > 64 {
		return 0, errors.New("invalid input")
	}
	return uint64(math.Pow(2, float64(i-1))), nil
}

// Total returns value for 64 squares in the chestboard
func Total() uint64 {
	var sum uint64
	for i := 1; i <= 64; i++ {
		cell, _ := Square(i)
		sum += cell
	}
	return sum
}
