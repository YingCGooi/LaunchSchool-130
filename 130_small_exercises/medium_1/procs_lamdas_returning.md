### Group 1

```ruby
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end
```

If we `return` from within a `Proc`, and that `Proc` is initialized within a method. We will immediately exit (or `return` from that method.

### Group 2
```ruby
# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)
```

If we `return` from within a `Proc` and that `Proc` is initialized outside of a method. An error will be thrown when we call it within the method.

This occurs because program execution jumps to where the `Proc` was defined, which is in the main scope. We cannot `return` from the top level of the program.

### Group 3

```ruby
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda
```

If we `return` from within a `Lamda`, and that `Lambda` is defined within a method, then program executions jumps to where the `Lambda` is defined. After that, code execution proceeds to the next line of method after the `#call` to that lambda.

### Group 4
```ruby
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)
```

If we `return` from within a `Lambda` and that `Lambda` is defined outside a method, the program execution continues to the next line. `return` are self-contained within `Lambda`

### Group 5
```ruby
def block_method_3
  yield
end

block_method_3 { return }
```

An error will be thrown. The same reason for error as the one mentioned for `Proc` when it is defined in the main scope. 

### Comparison
`Proc`s and implicit blocks sometimes have the same behavior when we `return` from them.
If `Proc` is defined outside a method, and we `return` within it, then we'll get an error (since `return` execution jumps to the main scope/top-level) 
The same thing happens if we try to `return` from an implicit block, where the block itself isn't defined in a method. An error is thrown if we try to `return` from it.

If we `return` from within a `Proc` initialized within a method, then we immediately exit the method.

If we `return` from within a `Lambda`, program execution will proceed to the next line after the `#call` to that lambda.





