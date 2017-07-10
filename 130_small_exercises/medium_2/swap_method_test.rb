require "minitest/autorun"

require_relative "text.rb"

class TextSwapTest < Minitest::Test
  def setup
    @file = File.open("sample.txt", 'r')
    @text = Text.new(@file.read)
    # create an instance of class Text
  end

  def test_swap
    actual_text = @text.swap('a', 'e')

    expected_text = <<~TEXT
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    # manual processing is done here.

    assert_equal(expected_text, actual_text)
  end

  def test_word_count
    assert_equal(72, @text.word_count)
  end

  def teardown  # Ruby can be a bit lenient when it comes to closing files.
  # File object associated with @file would be closed when our script is finished running.
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end