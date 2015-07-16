class CommentsController < ApplicationController
 before_action :correct_user, only: [:create, :destroy]

  def create
  	content = params[:comment][:content]
  	post_id = params[:post_id]
  	@comment = current_user.comments.build(content: content,
  																					post_id: post_id)
		if @comment.save
			redirect_to (:back)
		else
			redirect_to (:back)
		end  	
  end

  def destroy
  end
end
