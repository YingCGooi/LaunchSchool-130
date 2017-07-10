require 'minitest/autorun'

class EqualityAssertions < MiniTest::Test
  def setup; end

  def test_downcase
    value = 'ABC'
    assert_equal('xyz', value.downcase)
    # tests the first two arguments are equal using #==
    # the first argument represents the expected value, second argument represents the actual value
  end
end