class ReturnMethod < ActiveRecord::Base

  acts_as_indexed :fields => [:method1, :method2, :method3, :method4, :method5, :method6, :method7, :method8, :method9, :method10]

  validates :method1, :presence => true, :uniqueness => true
  
end
