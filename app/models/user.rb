class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, presence: true, :on =>:create
	validates :password_confirmation, presence: true, :on => :create
	has_many :secrets
	has_many :likes, dependent: :destroy
	has_many :secrets_liked, through: :likes, source: :secret
	def self.HasLiked (user_id, secret_id)
		
		if Like.where(user_id: user_id, secret_id: secret_id).count == 1
			return true
		else
			return false
		end
	end
end
