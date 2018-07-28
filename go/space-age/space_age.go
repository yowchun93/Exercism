package space

type Planet = string

const earthYear = 31557600

func Age(seconds float64, planet string) float64 {
	if planet == "Earth" {
		return round(seconds / float64(earthYear))
	} else if planet == "Mercury" {
		return round(seconds / mercuryYear(earthYear))
	} else if planet == "Venus" {
		return round(seconds / venusYear(earthYear))
	} else if planet == "Mars" {
		return round(seconds / marsYear(earthYear))
	} else if planet == "Jupiter" {
		return round(seconds / jupiterYear(earthYear))
	} else if planet == "Saturn" {
		return round(seconds / saturnYear(earthYear))
	} else if planet == "Uranus" {
		return round(seconds / uranusYear(earthYear))
	} else if planet == "Neptune" {
		return round(seconds / neptuneYear(earthYear))
	} else {
		return float64(0)
	}
}

func round(n float64) float64 {
	return float64(int64(n/0.01+0.5)) * 0.01
}

func mercuryYear(n int) float64 {
	return float64(n) * float64(0.2408467)
}

func venusYear(n int) float64 {
	return float64(n) * float64(0.61519726)
}

func marsYear(n int) float64 {
	return float64(n) * float64(1.8808158)
}

func jupiterYear(n int) float64 {
	return float64(n) * float64(11.862615)
}

func saturnYear(n int) float64 {
	return float64(n) * float64(29.447498)
}

func uranusYear(n int) float64 {
	return float64(n) * float64(84.016846)
}

func neptuneYear(n int) float64 {
	return float64(n) * float64(164.79132)
}
