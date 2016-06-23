class Url < ActiveRecord::Base
  belongs_to :user

  after_create :generate_short_url, unless: :short_url_supplied

  URl_MATCH = /\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z/

  validates :long_url,
            presence: true,
            format: { with: URl_MATCH }
  validates :short_url, uniqueness: true, exclusion: { in: %w(signup login urls) }

  def generate_short_url
    return if short_url.present?
    begin
      vanity_string = SecureRandom.urlsafe_base64(4).gsub(/[^A-Z0-9]/i, '')
      self.short_url = vanity_string
    end while Url.exists?(short_url: vanity_string)
    save
  end

  def short_url_supplied
    short_url && !Url.exists?(short_url: short_url)
  end
end
