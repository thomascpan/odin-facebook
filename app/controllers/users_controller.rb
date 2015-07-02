class UsersController < ApplicationController

  def newsfeed
  	@post = current_user.created_posts.build
  	@posts = current_user.created_posts.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
    @users = User.order(:first_name, :last_name)
  end

  def friends

  end

  def friend_requests

  end

  def find_friends

  end  
end
