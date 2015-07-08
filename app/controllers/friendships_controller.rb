class FriendshipsController < ApplicationController
  def create
  	friend = User.find(params[:friend_id])
    if Friendship.exists?(user_id: current_user.id, friend_id: friend.id) ||
      Friendship.exists?(user_id: friend.id, friend_id: current_user.id)
      current_user.accept_request(friend)
      redirect_to friends_path
    else
      current_user.send_request(friend)
  	  redirect_to users_path
    end
  end

  def destroy
  	user = current_user
    friend = User.find(params[:friend_id])
    Friendship.remove(user, friend)
    redirect_to friends_path
  end
end