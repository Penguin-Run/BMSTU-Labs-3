# frozen_string_literal: true

class Calc
  SIN_X = 3
  EPS_3 = 0.001
  EPS_4 = 0.0001
  PRECISE_VALUE = Math.sin(3)

  def calc_sin(eps)
    calc_value = SIN_X
    is_sum = false
    n_dependant = 3
    count = 0
    while (PRECISE_VALUE - calc_value).abs > eps
      if is_sum
        calc_value += (SIN_X**n_dependant) / factorial(n_dependant).to_f
      else
        calc_value -= (SIN_X**n_dependant) / factorial(n_dependant).to_f
      end
      is_sum = !is_sum
      n_dependant += 2
      count += 1
    end
    p 'Result calculated in ' + count.to_s + ' iterations'
    p 'Calculated value: ' + calc_value.to_s + ' (precise value is 0.1411200080598672)'
    calc_value
  end

  def factorial(nnn)
    if nnn.zero?
      1
    else
      nnn * factorial(nnn - 1)
    end
  end
end


