class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates(:name, presence: true, length: { maximum: 50 })
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i #Didn't quite get the solution of the exercice.
	validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false })
end
