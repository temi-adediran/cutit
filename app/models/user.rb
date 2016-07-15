class User < ActiveRecord::Base
  has_many :urls

  validates :username, presence: true
  validates :email, 
            presence: true, 
            uniqueness: true, 
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
            }
  validates :password_digest, presence: true, length: { minimum: 6 }
  has_secure_password

  def self.influential_users
    order(urls_count: :desc).limit(5)
  end
end
