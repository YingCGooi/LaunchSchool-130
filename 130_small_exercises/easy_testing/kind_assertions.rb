require 'minitest/autorun'

# Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Fixnum, Float, etc).

class KindAssertions < MiniTest::Test
  def setup; end

  def test_kind
    value = Integer.new
    assert_kind_of(Numeric, value)
    # assert_equal(true, value.instance_of?(Numeric))
  end
end