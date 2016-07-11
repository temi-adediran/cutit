class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  scope :influential_users, -> { order(urls_count: :desc).limit(5) }

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }
  validates :password_digest, presence: true, length: { minimum: 6 }
  has_many :urls

  has_secure_password
end
