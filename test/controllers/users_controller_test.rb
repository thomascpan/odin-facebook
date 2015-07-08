require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@user = users(:thomas)
		@other_user = users(:archer)
		@request.env["devise.mapping"] = Devise.mappings[:user]		
	end

	test "should redirect index when not logged in" do 
		get :index
		assert_redirected_to root_url
	end

	test "should get index" do 
		sign_in @user
		get :index
		assert_response :success
	end

	test "should get show" do 
		sign_in @user
		get :show, id: @other_user
		assert_response :success
	end

	test "should get newsfeed" do 
		sign_in @user 
		get :newsfeed
		assert_response :success
	end

	test "should get friends" do 
		sign_in @user
		get :friends
		assert_response :success
	end

	test "should get frind_friends" do 
		sign_in @user 
		get :friends 
		assert_response :success
	end
end
