# For this exercise, we'll be learning and practicing our knowledge of returning from lambdas, procs, and implicit blocks. Run each group of code below: For your answer to this exercise, write down your observations for each group of code. After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

# check_return_with_proc
# code returned on line 5 where the return keyword is executed within the block.

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)
# unexpected return (LocalJumpError) when a proc object with a return keyword within its block is called.

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda
# return keyword will not affect the method calling the lambda initialized within the method

# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)
# When a lamda with a return keyword is passed into the method, calling the lamda will not return the calling method.

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# implicit blocks with a return keyword when yielded will throw a LocalJumpError


# Comparison
#

# return keyword will not affect methods calling lamdas, however it will affect Procs and implicit block.
# if a Proc containing a return keyword within its block is initialized within a method, the method will return when the Proc is called.
# if a Lambda containing a return keyword within its block is called, no return effect will it have on the calling method.
# both implicit blocks and Procs defined outside of the method with a return keyword will cause Ruby to throw a LocalJumpError

