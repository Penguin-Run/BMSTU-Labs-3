# frozen_string_literal: true

# class with calculation
class CalcEnum
  SIN_X = 3
  EPS_3 = 0.001
  EPS_4 = 0.0001
  PRECISE_VALUE = Math.sin(3)

  def print(eps)
    p "Calculation:"
    calc_arr = CalcEnum.new.calc_sin_enum.find do |calc_value|
      (CalcEnum::PRECISE_VALUE - calc_value).abs < eps * 0.1
    end
    puts calc_arr
    puts "Precise value of sin(3): " + PRECISE_VALUE.to_s
  end

  def calc_sin_enum
    Enumerator.new do |yielded|
      calc_value = SIN_X
      is_sum = false
      n_dependant = 3
      count = 0

      loop do
        yielded.yield calc_value
        calculation = (SIN_X**n_dependant) / factorial(n_dependant).to_f
        is_sum ? calc_value += calculation : calc_value -= calculation
        is_sum = !is_sum
        n_dependant += 2
        count += 1
      end

      p calc_value
    end
  end

  def factorial(nnn)
    if nnn.zero?
      1
    else
      nnn * factorial(nnn - 1)
    end
  end
end
