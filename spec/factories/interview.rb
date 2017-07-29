FactoryGirl.define do
  factory :interview do
    challenge_id { Challenge.first.id }
    applicant_id { User.first.id }
    interviewer_id { User.last.id }
  end
end
