FactoryGirl.define do
  factory :visit do
    browser { Faker::Name.first_name }
    version { Faker::Number.decimal(2, 4) }
    os { Faker::Number.decimal(2, 4) }
    platform { Faker::Name.first_name }
  end
end
