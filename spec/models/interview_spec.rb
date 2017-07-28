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
end
