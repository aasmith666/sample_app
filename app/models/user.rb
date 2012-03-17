class User < ActiveRecord::Base
  #ADD ACCESSOR
  attr_accessor	:password
  
  #ADD SECURITY
  attr_accessible :name, :email, :password, :password_confirmation
  
  #Define regular expression variable for valid email address
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  #ADD VALIDATION
  validates :name,  	:presence 	=> true,
			:length   	=> { :maximum => 50 }
  
  validates :email, 	:presence 	=> true,
			:format	=> { :with => email_regex },
			:uniqueness	=> { :case_sensitive => false }
  
  validates :password,	:presence => true,
			:confirmation => true,
			:length => { :within => 6..40 }
  
  
end


# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#
