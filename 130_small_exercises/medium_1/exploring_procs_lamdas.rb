# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc # proc_obj
puts my_proc.class # Proc
my_proc.call # the block is called with no arguments
my_proc.call('cat') # you can pass in no arguments or specified argument. The block executes and assigns the value referenced by the argument to `thing`
#1 A new Proc object can be created with a call of `proc` instead of Proc.new
#2 A Proc is an object of class Proc
#3 A Proc does not require correct number of arguments passed to it. If nothing is passed, then nil is assigned to the block variable.

puts "==========================="
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" } # wrong number of arguments
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda # also a proc object, but has the (lambda) at the end
puts my_second_lambda # block executed, prints: This is a dog
puts my_lambda.class # a Proc object?
my_lambda.call('dog')
# my_lambda.call # wrong number of arguments
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }
# cannot instantiate a Lamda object by calling Lambda.new

#1 A new Lambda object can be created with a call to lambda or ->
# we cannot created a new Lambda object with Lambda.new
#2 A Lambda is actually a different variety of Proc
#3 While a Lambda is a Proc, it maintains separate identity from plain Proc. This can be seen when displaying a Lambda. The string displayed contains an extra "(lambda)"
#4 A lambda enforces the number of arguments. If the expected number of arguments are not passed to it, it throws an error.


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal') # no block given (LocalJumpError)
#1 a block passed to a method does not require the correct number of arguments. If a block variable is defined but no value passed to it, then nil will be assigned to that block variable
#2 if you have a yield and no block is passed, then an error is thrown

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end # seal is nil since it is specified with an argument but no value is supplied to it.
block_method_2('turtle') { puts "This is a #{animal}."} # animal is uninitialized. # throw an error if a variable referenced that doesn't exist in the block's scope

# Proc: you can pass in no arguments to call method and the block will still execute

# arity is the rules around enforcing the nuber of arguments you can call on a closure

# Lambdas are types of Procs. Technically they are both Proc objects, an implicit block is a grouping of code, a type of closure, not an Object.

# Lambdas enforce the number of arguments passed to them. Implicit block and Procs do not enforce the number of arguments passed in.

