class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => "User"

 def self.request(user, friend)
 		user_id = user.id
 		friend_id = friend.id
    unless user == friend or Friendship.exists?(user_id: user_id, friend_id: friend_id)
      transaction do
        create(:user => user, :friend => friend, :status => 'pending')
        create(:user => friend, :friend => user, :status => 'requested')
      end
    end
  end

  def self.accept(user, friend)
  	user_id = user.id
  	friend_id = friend_id
    transaction do
      accepted_at = Time.nowFr
      accept_one_side(user_id, friend_id, accepted_at)
      accept_one_side(friend_id, user_id, accepted_at)
    end
  end

	# Update the db with one side of an accepted friendship request.
	def self.accept_one_side(user_id, friend_id, accepted_at)
	    request = find_by_user_id_and_friend_id(user_id, friend_id)
	    request.status = 'accepted'
	    request.accepted_at = accepted_at
	    request.save!
	end

	private

		def find_by_user_id_and_friend_id(user_id, friend_id)
			Friendship.find_by(user_id: user, friend_id: friend)
		end
end
