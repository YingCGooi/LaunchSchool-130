# Write a unit test that will fail if list and the return value of list.process are different objects.

require 'minitest/autorun'

class List
  def process
    List.new
  end
end

class SameObjectAssertions < MiniTest::Test
  def setup; end

  def test_kind
    list = List.new
    assert_same(list, list.process)
    # assert_equal(true, value.instance_of?(Numeric))
  end
end