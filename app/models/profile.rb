class Profile < ActiveRecord::Base
	belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def country_name
    x = ISO3166::Country[country]
    x.translations[I18n.locale.to_s] || country.name
  end	
end