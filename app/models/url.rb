class Url < ActiveRecord::Base
  belongs_to :user, counter_cache: true
  has_many :visits, dependent: :destroy

  URl_MATCH = /\A(https?:\/\/)?([a-z0-9]+\.)?[a-z0-9\-]+\.[a-z]+.+[^\W\_]\z/

  validates :long_url, presence: true,
                       format: { with: URl_MATCH }
  validates :short_url, uniqueness: true, presence: true, 
                        exclusion: { in: %w(signup login urls dashboard logout
                                            signup update create destroy homepage url urls details) }

  before_validation :generate_short_url, unless: :short_url?
  before_save :convert_to_snake_case
 
  def self.recently_added
    order(created_at: :desc).limit(8)
  end

  def self.popular_links
    order(visits_count: :desc).limit(5)
  end

  def store_visit(user_agent)
    visits.create(
      browser: user_agent.browser,
      version: user_agent.version,
      os: user_agent.os,
      platform: user_agent.platform
    )
  end

  def generate_short_url
    begin
      self.short_url = SecureRandom.urlsafe_base64(4).gsub(/[^A-Z0-9]/i, '')
    end while Url.exists?(short_url: short_url)
  end

  def convert_to_snake_case
    self.short_url = short_url.tr(' ', '_') if short_url
  end
end
