# Group 6:
def my_method1
  my_proc = proc { return 'proc return' ; p 'after proc return' }
  puts '1: A'
  my_method2(my_proc)
  puts '1: B'           # does not get executed
  'my method 1 return'
end

def my_method2(my_proc)
  puts '2: C'
  my_proc.call # execution jumps to proc definition, then returns to main
  puts '2: D'  # does not get executed
end

p my_method1  # displays: '1: A', '2: C', 'proc return'
puts

# Group 7:
def my_method1
  my_lambda = lambda { return 'lambda return' ; p 'after lambda return' }
  puts '1: A'
  my_method2(my_lambda)
  puts '1: B'
  'my method 1 return'
end

def my_method2(my_lambda)
  puts '2: C'
  my_lambda.call # execution jumps to lambda definition, then returns to #call
  puts '2: D'    # execution continues to next line
end

p my_method1  # displays: '1: A', '2: C', '2: D', '1: B', 'my method 1 return'

# Group 8:
# return # does not raise LocalJumpError, even though we are returning from main
         # does this return to terminal?
p 1    # does not get executed

def my_method3(my_proc)
  my_proc.call
end

my_proc = proc { return }
# so why does this raise LocalJumpError if the line 37 did not?
my_method3(my_proc)