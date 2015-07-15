class Profile < ActiveRecord::Base
	attr_accessor :delete_avatar

	belongs_to :user

  has_attached_file :avatar, :styles => { :profile_banner => "160x160#", :medium => "300x300>", :thumb => "100x100>", :small => "15X15#", :post => "50x50#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  before_save :delete_profile_picture

  nilify_blanks

  def country_name
    x = ISO3166::Country[country]
    x.translations[I18n.locale.to_s] || country.name
  end

	  private

	  def delete_profile_picture
	    self.avatar = nil if delete_avatar == "1"
	  end
end