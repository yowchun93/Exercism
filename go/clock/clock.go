package clock

import "fmt"

const (
	hour          = 60
	minutesPerDay = 24 * 60
)

// Clock representation
type Clock int

//  divide by 1440, so you get the remainder of how many minutes is left
// left case where hours is negative, should default to 00:00
func New(hours int, minutes int) Clock {
	remainder := (hours*hour + minutes) % 1440
	return Clock(remainder)
}

func (clock Clock) String() string {
	return fmt.Sprintf("%02d:%02d", clock/hour, clock%hour)
}

// Adds minutes to Clock
func (clock Clock) Add(minutes int) Clock {
	return Clock((int(clock) + minutes) % 1440)
}

// Adds minutes to Clock
func (clock Clock) Subtract(minutes int) Clock {
	return Clock((int(clock) - minutes) % 1440)
}
