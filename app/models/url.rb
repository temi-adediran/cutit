class Url < ActiveRecord::Base
  belongs_to :user
  
  after_create :generate_short_url

  URl_MATCH = /\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z/

  validates :long_url,
            presence: true,
            format: { with: URl_MATCH }

   def generate_short_url
    begin
      vanity_string = SecureRandom.urlsafe_base64(4).gsub(/[^A-Z0-9]/i, "")
      self.short_url = vanity_string
    end while Url.exists?(short_url: vanity_string)

    self.save
   end         
end