require 'minitest/autorun'

class EmptyObjectAssertions < MiniTest::Test
  def setup; end

  def test_empty?
    list = [1,2,3]
    assert_empty(list)
    # clearer and issues a better failure message
    assert_equal(true, list.empty?)
  end
end