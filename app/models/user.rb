class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_posts, :foreign_key => "creator_id", :class_name => "Post", dependent: :destroy
  has_many :received_posts, :foreign_key => "receiver_id", :class_name => "Post", dependent: :destroy

  has_many :comments

  has_many :friendships
	has_many :friends, -> { where(friendships: {status: 'accepted'}) }, :through => :friendships

  has_many :pending_friends, -> { where(friendships: {status: 'pending'}) }, :through => :friendships, :source => :friend

  has_many :requesting_friends, -> { where(friendships: {status: 'requested'}) }, :through => :friendships, :source => :friend

  has_many :notifications

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true

  def send_request(friend)
    Friendship.request(self, friend)
  end

  def accept_request(friend)
    Friendship.accept(self, friend)
  end

  def remove_friendship(friend)
    Friendship.remove(self, friend)
  end

  def reset_notifications
    new_notifications = self.notifications.where(status: "new")
    new_notifications.each do |new_notification|
      new_notification.update_attribute(:status, "old")
    end
  end
end
