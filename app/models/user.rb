class User < ActiveRecord::Base
	attr_accessor :remember_token 
	before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password 

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # creates a random string
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # stores user digest inside database to decrypt persistent session
  def remember
  	self.remember_token = User.new_token
  	update_attribute(:remember_digest, User.digest(remember_token))
  end

  # checks if the remember token in the db matches the one passed in 
  def authenticated? (remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # sets the remember_digest to nil 
  def forget
    update_attribute(:remember_digest, nil)
  end

end
