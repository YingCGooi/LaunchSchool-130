require 'minitest/autorun'

class BooleanAssertionsTest < MiniTest::Test
  def setup
    @value = 4
  end

  def test_odd?
    assert(@value.odd?) # tests for a truthy value
    assert_equal(true, @value.odd) # test if the return value is true
  end
end