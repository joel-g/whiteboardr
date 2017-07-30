FactoryGirl.define do
  factory :challenge do
    title {"#{Faker::StarWars.quote} #{rand(999999)}"}
    body {"#{Faker::HarryPotter.quote} #{rand(999999)}"}
    difficulty {'Easy'}
    user_id {User.all.sample.id}
  end
end
