FactoryGirl.define do
  factory :tag do
    name {Faker::StarWars.character}
  end
end
