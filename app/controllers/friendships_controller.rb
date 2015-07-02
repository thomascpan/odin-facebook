class FriendshipsController < ApplicationController
  def create
  	user = current_user
  	friend = User.find(params[:friend_id])
  	# @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  	Friendship.request(current_user, friend)
  	redirect_to friend_requests_path
  end

  def destroy
  	@friendship = current_user.friendships.find(params[:id])
  	@friendship.destroy
  	flash[:notice] = "Removed friend."
  	redirect_to friends_path
  end
end
