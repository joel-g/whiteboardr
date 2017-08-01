require 'rails_helper'

describe Interview, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:interviewer_id) }
    it { is_expected.to validate_presence_of(:applicant_id) }
    it { is_expected.to validate_presence_of(:challenge_id) }
    it 'does not allow a applicant to interview themself' do
      interview = FactoryGirl.build(:interview)
      interview.applicant_id = interview.interviewer_id
      expect(interview.valid?).to be false
    end
    it 'doesn\'t create the same token for two interviews with all other attributes the same' do
      interview1 = FactoryGirl.create(:interview)
      interview2 = Interview.create(interviewer_id: interview1.interviewer_id, applicant_id: interview1.applicant_id, challenge_id: interview1.challenge_id, created_at: interview1.created_at, updated_at: interview1.updated_at)
      expect(interview1.token).not_to eq interview2.token
    end
  end
  context 'associations' do
    it { is_expected.to have_many(:feedbacks)}
    it { is_expected.to belong_to(:applicant)}
    it { is_expected.to belong_to(:interviewer)}
    it { is_expected.to belong_to(:challenge)}
  end
  context "helper method" do
    before(:each) do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:challenge)
      @interview = FactoryGirl.create(:interview)
      FactoryGirl.create(:feedback, knowledge_rating: 4, presence_rating: 4, board_rating: 4, riot_rating: 4, interview_id: @interview.id, user_id: user.id)
      FactoryGirl.create(:feedback, knowledge_rating: 5, presence_rating: 5, board_rating: 5, riot_rating: 5, interview_id: @interview.id, user_id: user.id)
    end
    describe "#average_knowledge_rating" do
      it 'returns the average knowledge rating' do
        expect(@interview.average_knowledge_rating).to eq 4.5
      end
    end
    describe "#average_presence_rating" do
      it 'returns the average presence rating' do
        expect(@interview.average_presence_rating).to eq 4.5
      end
    end
    describe "#average_riot_rating" do
      it 'returns the average riot rating' do
        expect(@interview.average_riot_rating).to eq 4.5
      end
    end
    describe "#average_board_rating" do
      it 'returns the average board rating' do
        expect(@interview.average_board_rating).to eq 4.5
      end
    end
    describe "#date" do
      it 'returns the date the interview was created in standard format' do
        expect(@interview.date).to eq  DateTime.now.strftime("%-m/%-d/%Y")
      end
    end
    describe "#has_feedback_from?" do
      it 'returns true if a user has given feedback' do
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:challenge)
        interview = FactoryGirl.create(:interview)
        FactoryGirl.create(:feedback, interview_id: interview.id, user_id: user.id)
        expect(interview.has_feedback_from?(user)).to eq true
      end
      it 'returns false if a user has not given feedback' do
        user = FactoryGirl.create(:user)
        user2 = FactoryGirl.create(:user)
        FactoryGirl.create(:challenge)
        interview = FactoryGirl.create(:interview)
        FactoryGirl.create(:feedback, interview_id: interview.id, user_id: user.id)
        expect(interview.has_feedback_from?(user2)).to eq false
      end
    end
  end
end
