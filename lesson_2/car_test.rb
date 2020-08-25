require 'minitest/autorun' # loads all the necessary files from the minitest gem
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car' # require the file that we're testing, car.rb

class CarTest < MiniTest::Test
  def test_wheels # creating an instance method that starts with test_
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip # 'skip' keyword tells Minitest to skip this test
    car = Car.new
    assert_equal(3, car.wheels)
  end
end