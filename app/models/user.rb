class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true
  validates :password, :length => { :minimum => 6 }
  has_many :urls
end
