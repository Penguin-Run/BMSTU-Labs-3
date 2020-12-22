require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/"
    assert_response :success
  end

  test 'should get question' do
    get '/question/1'
    assert_response :redirect
    assert_redirected_to '/login'
  end

  test 'should get ask' do
    get '/ask'
    assert_response :redirect
    assert_redirected_to '/login'
  end

end
