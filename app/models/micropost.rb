class Micropost < ActiveRecord::Base
	
	#ADD SECURITY
	attr_accessible :content
	
	#ADD ASSOCIATION
	belongs_to :user
	
	default_scope :order => 'microposts.created_at DESC'
	
end

# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

