 # fill in the missing part of the following code so we can convert an array of integers to base 8. Use the comments for help in determining where to make your modifications, and make sure to review the "Approach/Algorithm" section for this exercise; it should prove useful.
class Symbol  # reopen Symbol class to reimplement to_proc method
  def to_proc
    ->(object) { object.send(self) }
  end
end

def convert_to_base_8(n)
  n.to_s(8).to_i
end

p method(:convert_to_base_8)
p :convert_to_base_8.to_proc

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc
# method is from class Object

another_proc = Proc.new { |n| n.to_s(8).to_i }
# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object

# we use & and not &: to turn a proc into
# The expected return value of map on this number array should be:
p [8,10,12,14,16,33].map(&:to_s)
# methods that don't take an argument can be done this way
p [8,10,12,14,16,33].map(&base8_proc)
# since convert_to_base_8 takes one argument, we have to convert it to an Object object before converting it to a proc.

# [10, 12, 14, 16, 20, 41]