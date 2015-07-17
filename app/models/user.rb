class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :create_profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :created_posts, :foreign_key => "creator_id", :class_name => "Post", dependent: :destroy
  has_many :received_posts, :foreign_key => "receiver_id", :class_name => "Post", dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :friendships
	has_many :friends, -> { where(friendships: {status: 'accepted'}) }, :through => :friendships

  has_many :pending_friends, -> { where(friendships: {status: 'pending'}) }, :through => :friendships, :source => :friend

  has_many :requesting_friends, -> { where(friendships: {status: 'requested'}) }, :through => :friendships, :source => :friend

  has_many :notifications, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_one :profile, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.gender = auth.extra.raw.gender
    end

    # where(email: auth.info.email).first_or_create do |user|
    #   user.provider   = auth.provider
    #   user.uid        = auth.uid
    #   # user.email      = auth.info.email
    #   user.first_name = auth.info.first_name
    #   user.last_name  = auth.info.last_name
    #   user.gender     = auth.extra.raw_info.gender
    #   user.password   = Devise.friendly_token[0,20]
    # end    
  end  

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

  def feed(type)
    if type == "newsfeed"
      newsfeed
    elsif type == "timeline"
      timeline
    end
  end

  def friend?(user)
    friends.include?(user)
  end

  def name
    "#{first_name} #{last_name}"
  end

    private

    def timeline
      x = self.id
      query = "creator_id = #{x} or receiver_id = #{x}"
      Post.where(query).order(created_at: :desc)
    end

    def newsfeed
      x = self.id
      friend_ids = "SELECT friend_id FROM friendships
                    WHERE user_id = :user_id"
      Post.where("creator_id IN (#{friend_ids})
                  OR creator_id = :user_id", user_id: id).order(created_at: :desc)
    end    
end
