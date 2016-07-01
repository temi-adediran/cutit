FactoryGirl.define do
  factory :user, class: User do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { Faker::Internet.password }
  end
end
