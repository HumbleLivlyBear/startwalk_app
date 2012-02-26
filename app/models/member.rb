class Member < ActiveRecord::Base

  acts_as_indexed :fields => [:member_name, :email, :bio, :personal_link, :password]

  validates :member_name, :presence => true, :uniqueness => true
  
  belongs_to :member_photo, :class_name => 'Image'
  
  has_many :member_host_projects
  has_many :projects,  :through => :member_host_projects, :source => :project
  
  has_many :member_liked_projects
  has_many :likedprojects, :through => :member_liked_projects, :source => :project
end
