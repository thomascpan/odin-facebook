class NotificationsController < ApplicationController
  def index
  	@notifications = current_user.notifications.order(created_at: :desc)
  	current_user.reset_notifications
  end
end
