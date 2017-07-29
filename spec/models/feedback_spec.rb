require 'rails_helper'


describe Feedback, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:interview_id) }
    it { is_expected.to validate_presence_of(:board_rating) }
    it { is_expected.to validate_presence_of(:presence_rating) }
    it { is_expected.to validate_presence_of(:knowledge_rating) }
    it { is_expected.to validate_presence_of(:riot_rating) }
    it { is_expected.to validate_presence_of(:comments) }
  end
  context 'associations' do
    it { is_expected.to belong_to(:interview)}
    it { is_expected.to belong_to(:user)}
  end

end
