class LikesController < ApplicationController

  def create
  	likable_id = params[:likable_id]
  	likable_type = params[:likable_type]
  	current_user.likes.create(likable_id: likable_id,
  														likable_type: likable_type)
  	redirect_to (:back)
  end

  def destroy
		like = Like.find_by(id: params[:id])
  	if !like.nil?
  		like.delete
  	end
  	redirect_to (:back)
  end
end
