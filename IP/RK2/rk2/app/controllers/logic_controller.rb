class LogicController < ApplicationController
	def input; end

	def result
		input = params[:sequence]

		# TODO: validation

		@result = main_logic
	end


	def main_logic()
		
	end
end
