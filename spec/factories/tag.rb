FactoryGirl.define do
  factory :tag do
    name {Faker::Lorem.word + Faker::Lorem.word + Faker::Lorem.word}
  end
end
