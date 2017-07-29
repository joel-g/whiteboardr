require 'rails_helper'

describe Challenge, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:difficulty) }
  end
  context 'associations' do
    it { is_expected.to belong_to(:user)}
  end
  context 'virtual fields' do
    it 'has a title_and_difficulty field' do
      FactoryGirl.create(:user)
      challenge = FactoryGirl.create(:challenge)
      expect(challenge.title_and_difficulty).to eq "#{challenge.title} - #{challenge.difficulty}"
    end
  end
end
