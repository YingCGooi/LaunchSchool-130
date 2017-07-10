# Write a unit test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class Refutations < MiniTest::Test
  def setup; end

  def test_refutation
    list = [1, 2, 3, 'xyz']
    refute_includes(list, 'xyz')
  end
end
