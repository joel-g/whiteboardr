require 'rails_helper'

describe Interview, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:interviewer_id) }
    it { is_expected.to validate_presence_of(:applicant_id) }
    it { is_expected.to validate_presence_of(:challenge_id) }
  end
  context 'associations' do
    it { is_expected.to have_many(:feedbacks)}
    it { is_expected.to belong_to(:applicant)}
    it { is_expected.to belong_to(:interviewer)}
    it { is_expected.to belong_to(:challenge)}
  end
  context "helper method" do
    describe "#gave_feedback?" do
      it 'returns true if a user has given feedback' do
        user = FactoryGirl.create(:user)
        challenge = FactoryGirl.create(:challenge)
        interview = FactoryGirl.create(:interview)
        FactoryGirl.create(:feedback, interview_id: interview.id, user_id: user.id)
        expect(interview.gave_feedback?(user)).to eq true
      end
      it 'returns false if a user has not given feedback' do
        user = FactoryGirl.create(:user)
        user2 = FactoryGirl.create(:user)
        challenge = FactoryGirl.create(:challenge)
        interview = FactoryGirl.create(:interview)
        FactoryGirl.create(:feedback, interview_id: interview.id, user_id: user.id)
        expect(interview.gave_feedback?(user2)).to eq false
      end
    end
  end
end
