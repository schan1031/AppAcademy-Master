class User < ApplicationRecord

  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :goals

  def self.find_by_credentials(username,password)
    user=User.find_by(username: username)
    return nil if user.nil? || !user.is_password?(password)
    user
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

  def is_password?(password)
    digest=BCrypt::Password.new(self.password_digest)
    digest.is_password?(password)
  end

  def password=(pw)
    @password=pw
    self.password_digest=BCrypt::Password.create(pw)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
