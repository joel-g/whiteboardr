require 'rails_helper'

describe FeedbacksController do

  let!(:applicant){FactoryGirl.create(:user)}
  let!(:interviewer){FactoryGirl.create(:user)}
  let!(:challenge){FactoryGirl.create(:challenge)}
  let!(:interview){FactoryGirl.create(:interview, applicant_id: applicant.id, interviewer_id: interviewer.id)}
  let!(:feedback){FactoryGirl.create(:feedback, interview_id: interview.id)}
  let!(:valid_feedback_attributes) { FactoryGirl.attributes_for(:feedback) }
  let!(:invalid_feedback_attributes) { FactoryGirl.attributes_for(:feedback, comments: '') }


  before(:each) do
    @user = interviewer
    login_user
  end

  describe '#create' do
    context 'Valid feedback' do
      it 'redirects to interview' do
        post :create, params: { interview_id: interview.id, feedback: FactoryGirl.attributes_for(:feedback) }
        expect(response).to redirect_to interview_path(interview)
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
      it 'assigns @feedback with errors' do
        post :create, params: { interview_id: interview.id, feedback: { type: 'invalid' } }
        expect(assigns[:feedback].errors).not_to be_empty
      end
    end
  end

  describe '#edit' do
    it 'renders the feedback#edit page' do
      get :edit, params: {id: feedback.id, interview_id: interview.id}
      expect(response).to render_template 'feedbacks/edit'
    end
  end

  describe '#update' do
    context 'valid feedback attributes' do
      it 'updates the feedback attributes' do
        comments = feedback.comments
        patch :update, params: {feedback: valid_feedback_attributes, interview_id: interview.id, id: feedback.id}
        feedback.reload
        expect(feedback.comments).not_to eq comments
      end
      it 'redirects to interview#show' do
        patch :update, params: {feedback: valid_feedback_attributes, interview_id: interview.id, id: feedback.id}
        expect(response).to redirect_to interview_path(interview.id)
      end
    end
    context 'invalid feedback attributes' do
      it 're-renders the edit page' do
        patch :update, params: {feedback: invalid_feedback_attributes, interview_id: interview.id, id: feedback.id}
        expect(response).to render_template 'feedbacks/edit'
      end
    end
  end
end
