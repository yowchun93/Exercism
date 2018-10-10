package clock

import "fmt"

const (
	hour = 60
)

type Clock struct {
	minutes int
}

// New creates a brand new Clock
func New(hours int, minutes int) Clock {
	return Clock{(minutes + (hours * minutes_in_hour))}
}

func (clock Clock) String() string {
	// fmt.Println(clock)
	return fmt.Sprintf("%02d:%02d", clock.minutes/hour, clock.minutes%hour)
}

func (clock Clock) Add() {

}

// func (clock Clock) Add(minutes int) Clock {
// 	clock = (clock + Clock(minutes))
// }
