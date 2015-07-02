class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_posts, :foreign_key => "creator_id", :class_name => "Post", dependent: :destroy
  has_many :received_posts, :foreign_key => "reciver_id", :class_name => "Post", dependent: :destroy

  has_many :comments

  has_many :friendships
	has_many :friends, -> { where(friendships: {status: 'accepted'}) }, :through => :friendships

  has_many :pending_friends, -> { where(friendships: {status: 'pending'}) }, :through => :friendships, :source => :friend
end
