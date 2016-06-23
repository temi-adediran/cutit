class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_many :urls

  has_secure_password
end
