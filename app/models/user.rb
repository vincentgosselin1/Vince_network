class User < ActiveRecord::Base

	has_many :relationships, foreign_key: "friend_id", dependent: :destroy
	has_many :friends_with_users, through: :relationships, source: :friends_with

	has_many :reverse_relationships, foreign_key: "friends_with_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  	has_many :friends, through: :reverse_relationships, source: :friend

	before_save { self.email = email.downcase }
	validates(:name, presence: true, length: { maximum: 50 })
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i #Didn't quite get the solution of the exercice.
	validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false })

	def self.search(search)
		where("email ILIKE ?", "%#{search}%")
	end

  def a_friend?(other_user)
    relationships.find_by(friends_with_id: other_user.id)
  end

  def befriend!(other_user)
    relationships.create!(friends_with_id: other_user.id)
  end

end
