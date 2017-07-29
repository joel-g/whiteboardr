FactoryGirl.define do
  factory :challenge do
    title {Faker::StarWars.quote}
    body {Faker::HarryPotter.quote}
    difficulty {'Easy'}
    user_id {User.all.sample.id}
  end
end
