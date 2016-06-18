class Url < ActiveRecord::Base
  URL = 
	validates :long_url, :presence => true
  belongs_to :user
end
