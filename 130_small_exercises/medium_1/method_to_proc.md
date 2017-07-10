### Method to Proc

```ruby
comparator = proc { |a, b| b <=> a }
```

If we call the `Array#sort` method, this will not work:

```ruby
array.sort(comparator)
# ArgumentError raised

array.sort(&comparator) # we need to convert the Proc into block first.
```

The `&` causes ruby to try to convert the object to a block. If that object is a proc, the conversion happens automagically.

If the object is not a proc, then `&` attempts to call the `#to_proc` method first. 
Used with symbols, `&:to_s`, Ruby creates a proc that calls `#to_s` method on passed object, and converts that proc to a block.
It should be called "symbol to block"




