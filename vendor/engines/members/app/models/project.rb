class Project < ActiveRecord::Base

  acts_as_indexed :fields => [:case_name, :gist, :case_introduce, :case_update, :return_methods]

  validates :case_name, :presence => true, :uniqueness => true
  
  belongs_to :case_small_photo, :class_name => 'Image'
  belongs_to :case_promote_photo, :class_name => 'Image'
end
