module NotificationsHelper

	def notify(notification_type, sender, receiver)
		message = notifications_hash[notification_type]
		receiver.notifications.create(notification_type: notification_type, sender: sender, message: message)
	end

	private

		def notifications_hash
			hash = {:friend_requests => "has sent you a friend request.",
							:friends => "is now your friend.",
							:posts => "posted on your timeline.",
							:comments => "commented on your post."}
		end
end
