class Member < ActiveRecord::Base

  acts_as_indexed :fields => [:member_name, :email, :bio, :personal_link, :password]

  validates :member_name, :presence => true, :uniqueness => true
  
  belongs_to :member_photo, :class_name => 'Image'
end
