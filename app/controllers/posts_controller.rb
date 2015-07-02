class PostsController < ApplicationController

	def create
		@post = current_user.created_posts.build(post_params)
		if @post.save
			redirect_to newsfeed_path
		else
			render newsfeed_path
		end
	end

	private

		def post_params
			params.require(:post).permit(:content, :creator, :receiver)
		end
end
