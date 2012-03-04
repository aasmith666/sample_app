class User < ActiveRecord::Base
  #ADD SECURITY
  attr_accessible :name, :email
  
  #Define regular expression variable for valid email address
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #ADD VALIDATION
  validates :name, :presence 	=> true,
		   :length   	=> { :maximum => 50 }
  validates :email, :presence 	=> true,
		    :format	=> { :with => email_regex },
		    :uniqueness	=> { :case_sensitive => false }
  
  
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

