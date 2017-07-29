require 'rails_helper'

describe FeedbacksController do

  let!(:applicant){FactoryGirl.create(:user)}
  let!(:interviewer){FactoryGirl.create(:user, password: "pw")}
  let!(:challenge){FactoryGirl.create(:challenge)}
  let!(:interview){FactoryGirl.create(:interview, applicant_id: applicant.id, interviewer_id: interviewer.id)}

  before(:each) do
    @controller = SessionsController.new
    post :create, params: { email: interviewer.email, password: "pw"}
    @controller = FeedbacksController.new
  end

  describe '#create' do
    context 'Valid feedback' do
      it 'redirects to root' do
        post :create, params: { interview_id: interview.id, feedback: FactoryGirl.attributes_for(:feedback) }
        expect(response).to redirect_to root_path
      end
      it 'creates a new feedback' do
        expect{
          post :create, params: { interview_id: interview.id, feedback: FactoryGirl.attributes_for(:feedback) }
        }.to change { Feedback.all.count}.by 1
      end
    end
    context 'Invalid feedback' do
      it 'renders interview#show' do
        post :create, params: { interview_id: interview.id, feedback: FactoryGirl.attributes_for(:feedback, riot_rating: nil) }
        expect(response).to render_template "interviews/show"
      end
      it 'does not create a feedback' do
        expect{
          post :create, params: { interview_id: interview.id, feedback: FactoryGirl.attributes_for(:feedback, riot_rating: nil) }
        }.not_to change { Feedback.all.count}
      end
    end
  end
end