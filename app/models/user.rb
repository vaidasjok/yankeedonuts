class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name,  length: { maximum: 50, minimum: 1, :too_short => "negali būti tuščias" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, length: {maximum: 255, minimum: 5, :too_long => "per ilgas adresas", too_short: "per trumpas adresas"},
	                format: {with: VALID_EMAIL_REGEX, message: "netinkamas formatas"},
	                uniqueness: {case_sensitive: false, message: 'jau egzistuoja sistemoje'} 
	has_secure_password 
	validates :password, presence: { message: "negali būti tuščias" }, 
		length: { maximum: 255, minimum: 6, :too_long => "per ilgas", too_short: "per trumpas" }, 
		allow_nil: true
	validates :phone, presence: { message: "negali būti tuščias" }


	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
