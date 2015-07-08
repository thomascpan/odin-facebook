require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@user = users(:thomas)
		@other_user = users(:archer)
		@request.env["devise.mapping"] = Devise.mappings[:user]
	end	

	test "create should require logged-in user" do 
		assert_no_difference 'Friendship.count' do 
			post :create
		end
		assert_redirected_to root_url
	end

	test "should create friendship" do 
		sign_in @user
		assert_difference 'Friendship.count', 2 do 
			post :create, friend_id: @other_user
		end
	end
end
