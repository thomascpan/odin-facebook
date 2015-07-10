class UsersController < ApplicationController

  def newsfeed
  	@post = current_user.created_posts.build
  	@posts = current_user.created_posts.all
  end

  def timeline
  	@user = User.find(params[:id])
    @post = current_user.created_posts.build
  end

  def index
    @user = current_user
    @users = User.order(:first_name, :last_name)
    @pending_friends = current_user.pending_friends    
  end

  def friends
    @user = current_user
    @friends = current_user.friends
  end

  def friend_requests
    @user = current_user    
    @requesting_friends = current_user.requesting_friends
  end

  def find_friends
    @user = current_user
    @users = User.order(:first_name, :last_name)
    @pending_friends = current_user.pending_friends    
  end 
end
