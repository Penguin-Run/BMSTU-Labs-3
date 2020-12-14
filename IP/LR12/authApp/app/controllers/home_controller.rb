class HomeController < ApplicationController

	before_action :authenticate, only: [:index, :result]

  def index; end

  def result
  	number = params[:number]
		#---------------validation-----------------#
		if (number.to_i == 0) and (number != "0") 
			@result = "Please, input valid number"
		else
			@result = main_logic(number.to_i)
		end
		#---------------end-validation-----------------#
  end

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

	def palindrome?(number)
	  number.to_s.chars.zip(number.to_s.reverse.chars).each { |elem1, elem2| return false if elem1 != elem2 }
	  true
	end

	def reverse_number(number)
	  number.to_s.reverse.to_i
	end
end
