class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_posts, :foreign_key => "creator_id", :class_name => "Post", dependent: :destroy
  has_many :received_posts, :foreign_key => "reciver_id", :class_name => "Post", dependent: :destroy

  has_many :comments




end
