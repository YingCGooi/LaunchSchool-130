# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name.The first time you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random: they should not follow a predictable sequence. Random names means a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

class Robot
  attr_reader :name

  def initialize
    reset
    reset if same_name_with_other?
  end

  def same_name_with_other?
    ObjectSpace.each_object(Robot).map(&:name).count(name) > 1
  end

  def reset
    @name = [*"AA".."ZZ"].sample + [*"000".."999"].sample
  end
end



Kernel.srand 1000
p Robot.new
p Robot.new
p Robot.new
# 200.times { Robot.new }
# p ObjectSpace.each_object(Robot).map(&:name)