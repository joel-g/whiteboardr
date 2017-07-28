FactoryGirl.define do
  factory :user do
    username {Faker::Internet.user_name}
    email {Faker::Internet.safe_email}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    password {Faker::Internet.password}
  end
end
