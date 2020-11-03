class IoManagerController < ApplicationController
	def input; end

	def result
		input = params[:number]
		# validation
		if (input.to_i == 0) and (input != "0") 
			@result = "Please, input valid number"
		else
			@result = main_logic(input.to_i)
		end
	end


	def main_logic(number)
		# stuck on 98798674657
	  calc = Enumerator.new do |check_func|
	    loop do
	      number = number + reverse_number(number)
	      check_func.yield number
	    end
	  end
	  result = calc.take_while { |calc_value| (not palindrome?(calc_value)) }
	  result.push(number)
	end

	def palindrome?(number)
	  number.to_s.chars.zip(number.to_s.reverse.chars).each { |elem1, elem2| return false if elem1 != elem2 }
	  true
	end

	def reverse_number(number)
	  (number
	       .to_s
	       .reverse
	       .chars
	       .reduce('') { |sum, elem| sum + elem }).to_i
	end
end
