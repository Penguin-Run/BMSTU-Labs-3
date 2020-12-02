# frozen_string_literal: true

# controllers
class MethodController < ApplicationController
  def input; end

  def main_logic(number)
    # stuck on 98798674657
    calc = Enumerator.new do |check_func|
      index = 0
      loop do
        number = number + reverse_number(number)
        check_func.yield number
        index += 1
        if (index > 10000) 
          return "Execution time expired" + " (> 10 000 iterations)"
        end
      end
    end
    result = calc.take_while { |calc_value, index| (not palindrome?(calc_value)) }
    result.push(number)
  end

  def view
    number = params[:number]
    #---------------validation-----------------#
    if (number.to_i == 0) and (number != "0") 
      @result = "Please, input valid number"
    else
    #---------------end-validation-----------------#
      if (res = Result.find_by_value(number.to_i))
        @result = ActiveSupport::JSON.decode(res.result)
      else
        @result = main_logic(number.to_i)
        res = Result.create value: number.to_i, result: ActiveSupport::JSON.encode(@result)
        res.save
      end 
    end

    respond_to do |format|
      format.html 
      format.json do
        render json:
          { type_result: @result.class.to_s, value_result: @result }
      end
    end 
  end

  def results
    result = Result.all.map { |el| { value: el.value, result: ActiveSupport::JSON.decode(el.result) } }

    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end

  def palindrome?(number)
    number.to_s.chars.zip(number.to_s.reverse.chars).each { |elem1, elem2| return false if elem1 != elem2 }
    true
  end

  def reverse_number(number)
    number.to_s.reverse.to_i
  end
end
