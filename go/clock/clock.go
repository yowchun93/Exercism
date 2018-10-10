package clock

import "fmt"

const (
	hour          = 60
	minutesPerDay = 24 * hour
)

type Clock struct {
	minutes int
}

// New creates a brand new Clock
// func New(hours int, minutes int) Clock {
// 	return Clock{(minutes + (hours * hour))}
// }

func New(hours int, minutes int) Clock {
	m := (hours*hour + minutes) % minutesPerDay
	return Clock{m}
}

// func (clock Clock) String() string {
// 	return fmt.Sprintf("%02d:%02d", clock.minutes/hour, clock.minutes%hour)
// }

func (c Clock) String() string {
	m := c.minutes
	h := m / hour
	return fmt.Sprintf("%02d:%02d", h, m)
}

// func (clock Clock) Add(minutes int) Clock {
// 	clock = Clock((int(clock) + day + minutes%day) % day)
// 	return clock
// }
