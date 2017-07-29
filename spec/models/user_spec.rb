require 'rails_helper'


describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    subject { FactoryGirl.build(:user) }
    it { is_expected.to validate_uniqueness_of(:email)}
    it { is_expected.to validate_uniqueness_of(:username)}
  end
  context 'associations' do
    it { is_expected.to have_many(:interviews)}
    it { is_expected.to have_many(:feedbacks)}
  end

  context 'virtual attributes' do
    it 'has a full name' do
      user = FactoryGirl.build(:user)
      expect(user.full_name).to eq "#{user.first_name} #{user.last_name}"      
    end
  end

end
