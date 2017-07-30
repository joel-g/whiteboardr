require 'rails_helper'

describe ChallengeTag, type: :model do
  FactoryGirl.create(:user)
  3.times { FactoryGirl.create(:challenge)}
  6.times { FactoryGirl.create(:tag)}
  let!(:challenge_tag) {FactoryGirl.create(:challenge_tag)}
  context 'validations' do
    it { is_expected.to validate_presence_of(:challenge_id) }
    it { is_expected.to validate_presence_of(:tag_id) }
  end
  context 'associations' do
    it { is_expected.to belong_to(:challenge)}
    it { is_expected.to belong_to(:tag)}
  end
end
