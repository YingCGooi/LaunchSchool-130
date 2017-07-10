require 'minitest/autorun'

class IncludedObjectAssertions < MiniTest::Test
  def setup; end

  def test_empty?
    list = [1, 2, 3]
    assert_includes(list, 'xyz')
    # clearer error message
  end

  def test_empty_using_assert_equal?
    list = [1, 2, 3]
    assert_equal(true, list.include?('xyz'))
  end
end