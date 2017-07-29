FactoryGirl.define do
  factory :feedback do
    user_id {User.all.sample.id}
    interview_id {Interview.all.sample.id}
    board_rating {rand(1..5)}
    presence_rating {rand(1..5)}
    knowledge_rating {rand(1..5)}
    riot_rating {rand(1..5)}
    comments {Faker::StarWars.quote}
  end
end
