### Blocks and Variable Scope

```ruby
level_1 = "outer-most variable"

[1, 2, 3].each do |n|                     # block creates a new scope
  level_2 = "inner variable"

  ['a', 'b', 'c'].each do |n2|            # nested block creates a nested scope
    level_3 = "inner-most variable"

    # all three level_X variables are accessible here
  end

  # level_1 is accessible here
  # level_2 is accessible here
  # level_3 is not accessible here

end

# level_1 is accessible here
# level_2 is not accessible here
# level_3 is not accessible here
```

### Closure and binding

Closure is a general computing concept of a "chunk of code" that you can pass around and execute at some later time.

```ruby
name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
```

The above code , nothing will happen.
We've created a Proc and saved it to `chunk_of_code`, but haven't executed it yet.

```ruby
def call_me(some_code)
  some_code.call            # call will execute the "chunk of code" that gets passed in
end

name = "Robert" # initialized outside the method definition
chunk_of_code = Proc.new {puts "hi #{name}"}

call_me(chunk_of_code)
# hi Robert
# => nil
```

```ruby
def call_me(some_code)
  some_code.call
end

name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}
name = "Griffin III"        # re-assign name after Proc initialization

call_me(chunk_of_code)
# hi Griffin III
# => nil
```

Proc keeps track of its surrounding context and drags it aound wherever the chunk of code is passed to. 
In Ruby, we call this **binding**, or surrounding environment/context.

A closure must keep track of its surrounding context. This also include method references, constants and other artifacts.

