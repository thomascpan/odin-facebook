require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
  	@friendship = Friendship.new(user_id: 1, friend_id: 2, status: "pending")
  end

  test "should be valid" do 
  	assert @friendship.valid?
  end

  test "should require a user_id" do
  	@friendship.user_id = nil
  	assert_not @friendship.valid?
  end

  test "should require a friend_id" do
  	@friendship.user_id = nil
  	assert_not @friendship.valid?
  end

  test "should require a status" do 
  	@friendship.status = nil
  	assert_not @friendship.valid?
  end
end
