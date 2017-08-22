```ruby
[1, 2, 3, 4, 5].map(&:to_s)                     # => ["1", "2", "3", "4", "5"]
```

```ruby
[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i)         # => [1, 2, 3, 4, 5]
["hello", "world"].each(&:upcase!)              # => ["HELLO", "WORLD"]
[1, 2, 3, 4, 5].select(&:odd?)                  # => [1, 3, 5]
[1, 2, 3, 4, 5].select(&:odd?).any?(&:even?)    # => false
```

`&:` must be followed by a valid method that can be invoked on each element

### Symbol#to_proc
```ruby
(&:to_s)
# converts to..
{ |n| n.to_s }
```

`&` is added, tells Ruby to convert this object into a block. If the object after `&` is not a Proc, Ruby will call `to_proc` on the object.
Then, then `&` will turn the Proc into a block.

`:to_s` is a symbol. Ruby can call `Symbol#to_proc` on it and return a `Proc` object.

The symbol has to correspond to a method given by the Ruby Standard Library before `#to_proc` can properly convert it to an appropriate `Proc` object.

### Examples

```ruby
def my_method
  yield(2)
end

# turns the symbol into a Proc, then & turns the Proc into a block
a_proc = :to_s.to_proc  # explicitly call to_proc on the symbol
my_method(&a_proc)               # => "2"
```

