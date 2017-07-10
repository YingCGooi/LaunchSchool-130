require 'minitest/autorun'
# loads all necessary files from minitest gem

require_relative 'car'
# require the file that we're testing

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end