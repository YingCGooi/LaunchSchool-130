# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items) # yield the array into a block
  puts "Let's start gathering food."
end

# give users more flexibity on how they wish to use gather.
gather(items) { |produce| puts "#{produce.join(' ')}" }