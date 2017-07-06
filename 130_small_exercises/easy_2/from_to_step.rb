# def step(start, ending, step_val)
#   current_value = start
#   loop do
#     yield(current_value)
#     break if current_value + step_val > ending
#     current_value += step_val
#   end
#   current_value
# end

def step(start, limit, increment, &block)
  start > limit ? return : block.call(start)
  step(start + increment, limit, increment, &block)
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10