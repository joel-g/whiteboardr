require 'rails_helper'

describe Challenge, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:difficulty) }
    it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
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

    it 'can show challenges associated with a particular tag' do
      FactoryGirl.create(:user)

      tag1 = FactoryGirl.create(:tag, name: "algorithm")

      challenge1 = FactoryGirl.create(:challenge)

      FactoryGirl.create(:challenge)

      FactoryGirl.create(:challenge_tag, challenge_id: challenge1.id, tag_id: tag1.id)

      expect(Challenge.tagged_with("algorithm")).to match_array([challenge1])
    end
  end
end
