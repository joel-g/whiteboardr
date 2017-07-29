FactoryGirl.define do
  factory :interview do
    interviewer_id {User.all.sample.id}
    applicant_id {User.all.sample.id}
    challenge_id {Challenge.all.sample.id}
  end
end
