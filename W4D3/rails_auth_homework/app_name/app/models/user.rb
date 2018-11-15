class User < ApplicationRecord
  attr_reader :password

  before_validaion :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :password_digest, presence: { message: 'Password can\'t be blank'}

  def find_by_credentials(username, password)
    User.find_by(username: username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(64)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token||= User.generate_session_token
  end

  def password=(arg)
    @password = arg
    @password_digest = BCrypt::Password.create(password)
  end
  # private
  # def users_params
  #   params.require(:user).permit[:username, :password]
  # end
end
