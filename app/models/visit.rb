class Visit < ActiveRecord::Base
  belongs_to :url, counter_cache: true
end
