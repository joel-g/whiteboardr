FactoryGirl.define do
  factory :challenge_tag do
    challenge_id {Challenge.all.sample.id}
    tag_id {Tag.all.sample.id}
  end
end
