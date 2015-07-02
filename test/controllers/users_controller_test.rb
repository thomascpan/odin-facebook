require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get newsfeed" do
    get :newsfeed
    assert_response :success
  end

end
