# method implementation
def times(number)
  counter = 0 # method local variable initialized to 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number # return the original argument passed in
end

# method invocation
times(5) do |num|
  puts num
end

#1 Method invocation starts at line 13, where `times` is called with an argument `5`, and a block of code.

#2 Execution goes to the first line of method body on line 3, where local variable `counter` is initialized

#3 Line 4: `while` conditional is evaluated. The first time, condition is `true`

#4 Line 5: yields to the the block, passing in current `counter` - `0` as an argument. Block is executed.

#5 Line 13: the current `counter` referencing a value of 0 is assigned to block local variable `num`

#6 Line 14: `puts` is called, outputs the block local variable `num`. Last statement evaluates to `nil`, which is the block return value.

#7 Line 6: Once block execution ends, continues back to the `times` method implementation, `counter` is incremented by 1.

#8 Line 7: End of while loop, execution goes back to Line 4 , repeating steps 3 through 7, with `counter` value incrementing at each iteration.

#9 At some point, `while` conditional return `false`, flowing execution to Line 9.

#10 Since the last evaluted statement within `times` method is just `number`. Execution of the entire method will return `number` local variable

