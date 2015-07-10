class UsersController < ApplicationController

  def newsfeed
    @user = current_user
  	@post = current_user.created_posts.build
    @feed = current_user.feed
  end

  def timeline
  	@user = User.find(params[:id])
    @post = current_user.created_posts.build
    # temporary wall feed
    @feed = @user.feed
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


    # content = params[:post][:content]
    # receiver = current_user
    # @post = current_user.created_posts.create(content: content,
    #                                           receiver: receiver) 