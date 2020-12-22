require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get "/sessions/new"
    assert_response :success
  end

  test "should get create" do
    get "/login"
    assert_response :success
  end
end
