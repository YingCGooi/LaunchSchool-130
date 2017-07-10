require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionAssertions < MiniTest::Test
  def setup; end

  def test_exception
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end