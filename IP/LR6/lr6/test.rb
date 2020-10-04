require './calc_sin.rb'
require './calc_sin_enum.rb'
require './differ.rb'
require 'minitest/autorun'


# Class for setting any tests on functions
class Tests < MiniTest::Test
  def setup; end

  def test_calc_sin
    assert_in_delta(Math.sin(3), Calc.new.calc_sin(Calc::EPS_3), Calc::EPS_3)
    assert_in_delta(Math.sin(3), Calc.new.calc_sin(Calc::EPS_4), Calc::EPS_4)
  end

  def test_calc_sin_enum
    assert_in_delta(Math.sin(3), Calc_enum.new.print(Calc_enum::EPS_3), Calc::EPS_3)
    assert_in_delta(Math.sin(3), Calc_enum.new.print(Calc_enum::EPS_4), Calc::EPS_4)
  end

  def test_differ_lambda
    assert_equal([0.88, 0.88, 0.87], Differ.new.differ_with_lambda(->(x) { Math.sin(x) }))
    assert_equal([1.28, 1.30, 1.31], Differ.new.differ_with_lambda(->(x) { Math.tan(x) }))
  end

  def test_differ_block
    assert_equal([0.88, 0.88, 0.87], Differ.new.differ_with_block { |x| Math.sin(x) })
    assert_equal([1.28, 1.30, 1.31], Differ.new.differ_with_block{ |x| Math.tan(x) })
  end

  def teardown; end
end