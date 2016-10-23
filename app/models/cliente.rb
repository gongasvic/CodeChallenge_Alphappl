class Cliente < ActiveRecord::Base
	attr_accessor :remember_token

	validates :nome, presence: true, length: { minimum: 1 }
	validates :morada, presence: true
	validates :cidade, presence: true
	validates :pais, presence: true
	validates :mail, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, uniqueness: { case_sensitive: false }
	validates :telefone, presence: true, length: { minimum: 9, maximum: 9 }
	validates :cpostal, presence: true
	validates :nif, presence: true, length: { minimum: 9, maximum: 9 }
	validates :cardNumb, presence: true, length: { maximum: 9 }
	validates :expDate, presence: true
	validates :nomeCartao, presence: true
  has_secure_password
	validates :password, presence: true, length: { minimum: 6 }

	# Returns the hash digest of the given string.
  	def Cliente.digest(string)
    	cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    	BCrypt::Password.create(string, cost: cost)
  	end

  	# Returns a random token.
  	def Cliente.new_token
    	SecureRandom.urlsafe_base64
  	end
  	def remember
    	self.remember_token = Cliente.new_token
    	update_attribute(:remember_digest, Cliente.digest(remember_token))
  	end

  	 # Returns true if the given token matches the digest.
  	def authenticated?(remember_token)
    	return false if remember_digest.nil?
    	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  	end

	# Forgets a user.
	def forget
		update_attribute(:remember_digest, nil)
	end
end
