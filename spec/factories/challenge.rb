FactoryGirl.define do
  factory :challenge do
    title {Faker::StarWars.quote + ' ' + Faker::Lorem.word}
    body {Faker::HarryPotter.quote + ' ' + Faker::Lorem.word}
    difficulty {'Easy'}
    user_id {User.all.sample.id}
  end
end
