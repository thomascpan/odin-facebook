class Notification < ActiveRecord::Base
	belongs_to :user

	validates :message, presence: true
	validates :notification_type, presence: true
	validates :sender, presence: true
end
