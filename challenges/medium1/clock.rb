# Create a clock that is independent of date.

# You should be able to add and subtract minutes to it. Two clocks that represent the same time should be equal to each other.

class Clock
  attr_accessor :time

  def initialize(hour, minutes)
    @time = Time.new(2017, 1, 1, hour, minutes)
  end

  def self.at(hour, minutes = 0)
    new(hour, minutes)
  end

  def +(minute)
    self.time += minute * 60
    self
  end

  def -(minute)
    self.time -= minute * 60
    self
  end

  def to_s
    time.strftime('%H:%M')
  end

  def ==(other_clock)
    self.time == other_clock.time
  end
end

p (Clock.at(10) + 2).to_s
p Clock.at(10) - 2