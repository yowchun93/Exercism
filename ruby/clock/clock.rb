class Clock 
  
  def initialize(hour: ,minute: 0)
    @minutes = (( hour * 60) + minute)
  end

  def to_s
    "#{(@minutes / 60).to_s.rjust(2,'0')}:#{(@minutes % 60).to_s.rjust(2,'0')}"
  end

end