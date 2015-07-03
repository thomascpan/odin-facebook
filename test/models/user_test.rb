require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(first_name: "Foo", last_name: "Bar", email: "foo@bar.com",
											password: "foobar", password_confirmation: "foobar", gender: "male")
	end

	test "should be valid" do 
		assert @user.valid?
	end

	test "first_name and last_name should be present" do 
		@user.first_name = "   "
		@user.last_name = "   "
		assert_not @user.valid?
	end

	test "gender should be present" do 
		@user.gender = "  "
		assert_not @user.valid?
	end

	test "associated posts should be destroyed" do 
		@user.save
		@user.created_posts.create!(content: "bruh")
		assert_difference 'Post.count', -1 do 
			@user.destroy
		end
	end
end
