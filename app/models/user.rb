class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  #before_save { |user| user.email = email.downcase }
  before_save { email.downcase! }

  #validate name
  validates :name, presence: true, length: { maximum: 50 }

  # validate email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # validate password
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
