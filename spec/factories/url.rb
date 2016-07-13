FactoryGirl.define do
  factory :url, class: Url do
    long_url { Faker::Internet.url }
    short_url { Faker::Internet.slug }
    click_count { Faker::Number.number(1) }
  end
end
