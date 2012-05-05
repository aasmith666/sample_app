class Micropost < ActiveRecord::Base
	
	#ADD SECURITY
	attr_accessible :content
	
	#ADD ASSOCIATION
	belongs_to :user
	
	validates :content, :presence => true, :length => { :maximum => 140 }
	validates :user_id, :presence => true
	
	default_scope :order => 'microposts.created_at DESC'
	
	def self.from_users_followed_by(user)
		followed_ids = user.following.map(&:id).join(", ")
		where("user_id IN (#{followed_ids}) OR user_id =?", user)
	end
	
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

