class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessor :remember_token
  
  before_save { self.email = email.downcase }  
  before_save :encrypt_password
  after_save :clear_password
  
  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }   
  #has_secure_password   
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create
  
  def encrypt_password
    if password.present?
      #Rails.logger.debug("My password: #{true}")
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
  def authenticate(user, password)
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
      true
    else
      nil
    end
  end
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    self.update_column(:remember, User.digest(remember_token))
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember, nil)
  end
end
