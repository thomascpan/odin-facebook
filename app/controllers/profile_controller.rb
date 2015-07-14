class ProfileController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@profile = @user.profile
  end

  def edit
  	@user = User.find(params[:id])
  	@profile = @user.profile
  end

  def update
  	@user = User.find(params[:id])
  	@profile = @user.profile
  	if @profile.update_attributes(profile_params)
  		redirect_to profile_path(@user)
  	else
  		render 'edit'
  	end
  end

  private

  	def profile_params
  		params.require(:profile).permit(:avatar, :birthday, :country, :education, :profession, :about, :access, :email_notification)
		end
end
