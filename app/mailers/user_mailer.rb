class UserMailer < ApplicationMailer
	default from: 'thomascpan@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'https://cryptic-springs-9240.herokuapp.com'
		mail(to: @user.email, subject: 'Welcome to Odin-Facebook!')
	end
end
