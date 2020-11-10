require 'test_helper'

class IoManagerControllerTest < ActionController::TestCase
  test "should get input view" do
 	get :input
 	assert_response :success
   end 

   test "should get result view" do
 	get :result
 	assert_response :success
   end 

  test "test result with correct number" do
  	get :result, params: { number: 98798674656 }
  	result = assigns[:result]
  	last_number = result[result.size - 1]
  	assert_equal last_number, 57871374047317875
  end

  test "test result with incorrect input" do
  	get :result, params: { number: 'not_a_number' }
  	assert_equal assigns[:result], "Please, input valid number"
  end
end
