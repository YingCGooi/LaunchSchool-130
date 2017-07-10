require 'minitest/autorun'

class NilAsserions < MiniTest::Test
  def setup; end

  def test_nil
    value = nil
    assert_nil(value)
    # tests the first argument on whether or not it is nil
    assert_equal nil, value
    # issues a clearer and issues a better failure message
  end
end