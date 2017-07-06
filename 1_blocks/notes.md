## Closures in Ruby

Closure - allows to save a 'chunk of code' and execute it later.
- Binds its surrounding artifacts and build an 'enclosure' around everything.
- Artifacts can be referenced when the closure is later executed.

#### Proc objects
We can pass aroung a `Proc` object as a 'chunk of code' and execute it later. We can pass them into existing methods. 
`Proc` object or "chunk of code" retains references to its surrounding artifacts - its **binding**

## Calling method with blocks

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

The object we're working is the collection (`Array`)

```ruby
[1, 2, 3] # => Array object
```

The method we are calling on that object is `Array#each`
```
.each
```

The **block** is the `do..end` part:
```ruby
{ |num| puts num }
```

#### Return values and actions within the block

```ruby
# Example 1: passing in a block to the `Integer#times` method.

3.times do |num|
  puts num
end
=> 3 # ignoring the block

# Example 2: passing in a block to the `Array#map` method.

[1, 2, 3].map do |num|
  num + 1
end
=> [2, 3, 4] # new array, manipulated according to block

# Example 3: passing in a block to the `File::open` class method.

File.open('tmp.txt', 'w') do |file|
  file.write('first line!')
end
=> 11 # number of characters written to the file
```

The entire of block is passed in to the method like any other parameter. It is up to the method to decide what to do with the block, and execute it, or completely ignore it.

## Writing methods that take Blocks

```ruby
def hello
  "hello!"
end

hello                                    # => "hello!"
```

Calling it with parameters:

```ruby
hello("hi") 
# => ArgumentError: wrong number of arguments (1 for 0)
```

What if we called it within a block?
```ruby
hello { puts 'hi' }                      # => "hello!"
```

In Ruby, every method can take an optional block as implicit parameter.

#### Ignoring blocks
```ruby
def echo(str)
  str
end

echo                                          # => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!")                                # => "hello!"
echo("hello", "world!")                       # => ArgumentError: wrong number of arguments (2 for 1)

# this time, called with an implicit block
echo { puts "world" }                         # => ArgumentError: wrong number of arguments (0 for 1)
echo("hello!") { puts "world" }               # => "hello!"
echo("hello", "world!") { puts "world" }      # => ArgumentError: wrong number of arguments (2 for 1)
```

#### Yielding
```ruby
def echo_with_yield(str)
  yield
  str
end

echo_with_yield { puts "world" }                        # => ArgumentError: wrong number of arguments (0 for 1)
echo_with_yield("hello!") { puts "world" }              # world
echo_with_yield("hello", "world!") { puts "world" }     # => ArgumentError: wrong number of arguments (2 for 1)
```

`echo_with_yield("hello!") { puts "world" }` printed string "world" and returned the string "hello!"

- The arguments need to match the method definition, regardless whether or not we are passing in a block
- The `yield` keyword execute the block

```ruby
echo_with_yield("hello!") 
 # => LocalJumpError: no block given (yield)
```

The method has a `yield` in it somewhere, but we didn't include a block at method invocation. 

Only call `yield` when there's a block:

```ruby
def echo_with_yield(str)
  yield if block_given?
  str
end
```

We achieve this by calling `Kernel#block_given`

We can call `echo_with_yield` with or without a block.
If a block passed in, the `block_given?` will return `true`, our code will `yield` to the block.
If a block is not passed in, the `block_given?` will be false, and the only thing the method will do is return `str`

```ruby
echo_with_yield("hello!")                          # => "hello!"
echo_with_yield("hello!") { puts "world" }         # world
# => "hello!"
```

#### Passing execution to the block

```ruby
# method implementation
def say(words) #2 local variable words assigned to string 'hi there' # the block is passed in implicitly, without assigned to a variable
  yield if block_given?
  #3 yields to the block
  puts "> " + words #5 results in output being displayed.
  #6 method ends, last expression return value is nil, returned by the `puts` method.
end

# method invocation
say("hi there") do 
#1 Execution starts. The `say` method is invoked, with two parameters: a string and a block (block is an implicit parameter and not part of method invocation)
  system 'clear' #4 clears screen
end                                                # clears screen first, then outputs "> hi there"
```

It is useful to think of a block as an un-named or anonymous method.

#### Yielding block with an argument

When we have a block that requires an argument:

```ruby
3 # calling object
.times # method invoked
do |num| # num is block argument, make sure doesn't have a same name as any variable outside the scope of the block, otherwise variable shadowing
  puts num
end
```

Writing a method that takes a block that takes an argument.
```ruby
# method implementation
def increment(number)
  number + 1
end

# method invocation
increment(5)                            # => 6
```

We want to take some action on the newly incremented number at method invocation time. We want some flexibility at method usage. Update the implementation and pass in the incremented number into the block.

```ruby
# method implementation
def increment(number)
  if block_given?
    yield(number + 1)
  else
    number + 1
  end
end

# method invocation
increment(5) do |num|
  puts num
end # output 6
```

Line 203: Execution starts at method invocation `increment`, passing in the integer `5`

Line 194: Method implementation, assigns `5` to the local variable `number`, and block is not set to any variable, implicitly available

Line 195: conditional `if`. Indeed we passed in a block, so the `if`expression evaluates to `true`

Line 196: we are passing `number + 1` to the block, we are calling the block with `6` as the block argument.

Line 203: block local variable `num` is assigned `6`

Line 204: Last evaluated statement within the block: `puts` invoked, passing in `num`, outputting `num`, block return value is `nil`

Line 197: `else` ignored since `if` conditional evaluates to `true`

### Passing in different number of arguments into the block

Passing in one more argument to the block. Using only one argument within the block:

```ruby
# method implementation
def test
  yield(1, 2)                           # passing 2 block arguments at block invocation time
end

# method invocation
test { |num| puts num }                 # expecting 1 parameter in block implementation
# outputs 1
```

Passing in one less argument then used within the block:

```ruby
# method implementation
def test
  yield(1)                              # passing 1 block argument at block invocation time
end

# method invocation
test do |num1, num2|                    # expecting 2 parameters in block implementation
  puts "#{num1} #{num2}"
end # num2 is nil
# outputs 1
```

### Return value of yielding to the block

```ruby
compare('hi') { |word| word.upcase }
# Output:
# Before: hi
# After: HI
```

```ruby
def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# method invocation
compare('hello') { |word| word.upcase }
# Before: hello
# After: HELLO
# => nil
```

`after` local variable in the `compare` method implementation is assigned the return value from the block.
The return value is based on the last expression in the block.
Blocks can either mutate the argument with a destructive method call or block can return a value.
`=> nil` is the return value of the `compare` method, since the last expression in `compare` method is a `puts`, and therefore the return value of calling `compare` is always `nil`.

We could futher implement this `compare` method with variety of different implementations

```ruby
compare('hello') { |word| word.slice(1..2) }

# Before: hello
# After: el
# => nil
```

```ruby
compare('hello') { |word| "nothing to do with anything" }

# Before: hello
# After: nothing to do with anything
# => nil
```

More complicated example:

```ruby
compare('hello') { |word| puts "hi" }

# Before: hello
# hi
# After:
# => nil
```

### When to use blocks in your own methods
Use cases:

1. Defer some implementation code to method invocation decision.

- method implementor (not certain of how the method will be called), or wants to leave decision up to the method caller at invocation time
- method caller: could be the same person/developer as the method implementor

Without using blocks, the method implementor can allow method callers to pass in some flag.

Similar results achieved:
```ruby
def compare(str, flag) # user can pass in a flag
  after = case flag # the flag determined output
          when :upcase
            str.upcase
          when :capitalize
            str.capitalize
          # etc, we could have a lot of 'when' clauses
          end

  puts "Before: #{str}"
  puts "After: #{after}"
end

compare("hello", :upcase)

# Before: hello
# After: HELLO
# => nil
```

It is not flexible. Methods callers can't refine the implementation in this case, without modifying the method implementation.

By using blocks, method implementor can defer the decision of which flags to support and let the caller decide at method invocation time.

> **Hey, I don't know what the specifics of your scenarios are, so just pass them in when you need to call this method. I'll set it up so that you can refine it later, since you understand your scenario better.**

Standard library's methods are useful because they are buit in a generic sense, allowing us to refine the method through a block at invocation time.

Example, `Array#select`:
- we can pass in any expression that evaluates to a boolean
- if we don't have a flexible `select` method, we had `select_odds` or `select_greater_than(num)`

If you encounter a scenario where you are calling a method from multiple places, with one little tweak in each case, it may be a good idea to try to implement in a generic way by yielding to a block.


2. Methods that need to perform some "before" "after" actions - sandwich code. The method implementor doesn't care: before and after anything.

```ruby
def time_it
  time_before = Time.now
  # do something
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end
```

As method implementor, we don't care what code goes there in the # do something.

```ruby
def time_it
  time_before = Time.now
  yield                 # execute the implicit block
  time_after= Time.now

  puts "It took #{time_after - time_before} seconds."
end

time_it { sleep(3) }      # It took 3.003767 seconds.
                                        # => nil

time_it { "hello world" }   # It took 3.0e-06 seconds.
                                        # => nil
```

Timing, logging, notification systems are all examples where before/after actions are important.

Another area where before/after actions are important is in resource management, or interfacing with OS.
- first allocate a portion of a resource
- perform some clean up
Forgetting to do the clean up results in bugs - system crashes, memory leaks, etc.

```ruby
my_file = File.open("some_file.txt", "w+")          # creates a file called "some_file.txt" with write/read permissions
# write to this file using my_file.write
my_file.close
# releases my_file object from hangind on to system resources.
```

Using block syntax:

```ruby
File.open("some_file.txt", "w+") do |file|
  # write to this file using file.write
end
```

### Methods with an explicit block parameter
```ruby
def test(&block)
  puts "What's &block? #{block}" # & dropped when using in method implementation
end
```

The `&block` is a special parameter that will convert the implicitly passed in block into a `Proc` object.

```ruby
test { sleep(1) }

# What's &block? #<Proc:0x007f98e32b83c8@(irb):59>
# => nil
```

The block local variable is a now a `Proc` object.
- Adds flexibility
- Pass the block to another method


### Summary
- blocks are one way that Ruby implement closures
- Closures pass around an unnamed chunk of code to be executed later
- blocks can take arguments, but it won't complain about wrong number of arguments passed into it.
- blocks return a value, just like normal methods.
- blocks help to defer some implementation decisions to method invocation time. It allows method callers to refine a method at invocation time for a specific use case.
- Allows method implementors to build generic methods that can be used in variety of ways.
- blocks are good use case for "sandwich code", like closing a `File` automatically.




