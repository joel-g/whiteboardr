require 'rails_helper'

describe Tag, type: :model do
  let!(:tag) {FactoryGirl.create(:tag)}
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
  context 'associations' do
    it { is_expected.to have_many(:challenge_tags)}
    it { is_expected.to have_many(:challenges)}
  end
end
