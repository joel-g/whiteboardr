FactoryGirl.define do
  factory :user do
    username {"#{Faker::Internet.user_name}#{rand(999999)}"}
    email {"#{Faker::Internet.safe_email}#{rand(999999)}"}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    password {Faker::Internet.password}
  end
end
