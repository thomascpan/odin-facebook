class FriendshipsController < ApplicationController
  def create
  	user = current_user
  	friend = User.find(params[:friend_id])
  	if Friendship.request(current_user, friend).nil?
      Friendship.accept(user, friend)
      redirect_to friends_path
    else
  	 redirect_to friend_requests_path
    end
  end

  def destroy
  	user = current_user
    friend = User.find(params[:friend_id])
    Friendship.remove(user, friend)
    redirect_to friends_path
  end
end
