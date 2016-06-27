class Url < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :visits
  after_create :generate_short_url, unless: :short_url_supplied
  before_save :convert_to_snake_case

  URl_MATCH = /\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z/

  validates :long_url,
            presence: true,
            format: { with: URl_MATCH }
  validates :short_url, uniqueness: true, exclusion: { in: %w(signup login urls dashboard logout signup) }

  scope :recently_added, -> { order(created_at: :desc).limit(10) }
  scope :popular_links, -> { order(click_count: :desc).limit(10) }

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

  def convert_to_snake_case
    self.short_url = short_url.tr(' ', '_') if short_url
  end
end
