# input: size
# Array is going to contain max of 3 elements
# buffer position starts at 0
# ex. size = 7
# add 1 [1]
# add 2 [2, 1]
# add 3 [3, 2, 1]
# delete 2 elements [3]
# [9, 8, 7, 6, 5, 4, 3]
# add something => raise error
# add A, B (overwrite)
# [A, B, 9, 8, 7, 6, 5]
# delete 2 elements
# [A, B, 9, 8, 7]
class CircularBuffer
  class BufferEmptyException < RuntimeError; end
  class BufferFullException < RuntimeError; end

  def initialize(max_size)
    @max_size = max_size
    @buffer = []
  end

  def write(item)
    return if item.nil?
    raise BufferFullException if full?
    buffer.unshift(item)
  end

  def write!(item)
    return if item.nil?
    buffer.pop if full?
    write(item)
  end

  def read
    buffer.pop || raise(BufferEmptyException)
  end

  def clear
    self.buffer = []
  end

  def full?
    buffer.size >= @max_size
  end

  private

  attr_accessor :buffer
  attr_reader :max_size
end

