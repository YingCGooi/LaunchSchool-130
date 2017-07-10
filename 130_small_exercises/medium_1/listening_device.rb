# Below we have a listening device. It lets us record something that is said and store it for later use. In general, this is how the device should be used:

# Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

class Device
  def initialize
    @recordings = []
  end

  def listen(&block)
    block && record(block.call)
  end

  def play
    puts recordings.last
  end

  private

  attr_reader :recordings

  def record(recording)
    recordings << recording
  end
end

# Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be passed in. The listening device can also output what was recently recorded using a Device#play method.

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
