class Relationship < ActiveRecord::Base
	belongs_to :friend, class_name: "User"
  	belongs_to :friends_with, class_name: "User"
  	validates :friend_id, presence: true
  	validates :friends_with_id, presence: true
end
