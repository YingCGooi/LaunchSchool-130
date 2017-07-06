# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# Examples:

def compute(param=nil)
  return "Does not compute." if !block_given?
  yield(param)
end

p compute(5) { |param| 5 + 3 + param } # == 8
p compute('c') { |param| 'a' + 'b' + param } #== 'ab'
p compute == 'Does not compute.'


