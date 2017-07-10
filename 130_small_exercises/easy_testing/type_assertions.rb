require 'minitest/autorun'

class TypeAssertions < MiniTest::Test
  def setup; end

  def test_type
    value = Array.new
    assert_instance_of(Numeric, value)
    # assert_equal(true, value.instance_of?(Numeric))
  end
end