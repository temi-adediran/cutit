class Url < ActiveRecord::Base
	validates :long_url, :presence => true
  belongs_to :user
end
