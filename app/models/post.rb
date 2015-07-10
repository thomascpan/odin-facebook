class Post < ActiveRecord::Base

	belongs_to :creator, :class_name => "User"
	belongs_to :receiver, :class_name => "User"

	has_many :comments, dependent: :destroy


end
