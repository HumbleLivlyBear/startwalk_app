class Project < ActiveRecord::Base

  acts_as_indexed :fields => [:case_name, :gist, :case_introduce, :case_update, :return_methods]

  validates :case_name, :presence => true, :uniqueness => true
  
  belongs_to :case_small_photo, :class_name => 'Image'
  belongs_to :case_promote_photo, :class_name => 'Image'
  
  has_one :return_method
  
  has_many :member_host_projects
  has_many :hoster, :through => :member_host_projects, :source => :member
  
  has_many :member_liked_projects
  has_many :likedbymember, :through => :member_liked_projects, :source => :member
end
