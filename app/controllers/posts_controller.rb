class PostsController < ApplicationController

	def create
		content = params[:post][:content]
		receiver = User.find(params[:receiver_id])
		@post = current_user.created_posts.create(content: content, 
																							receiver: receiver)
		if @post.save
			redirect_to (:back)
		else
			render newsfeed_path
		end
	end
end
