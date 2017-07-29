require 'rails_helper'

describe InterviewsController do
  describe '#index' do
    it 'responds with a status of 200' do
      get :index
      expect(response.status).to eq 200
    end
    it 'renders the Interview#index view' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe '#new' do
    context 'when user is logged in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login_user
      end
      it 'responds with a status of 200' do
        get :new
        expect(response.status).to eq 200
      end
      it 'renders the Interview#new view' do
        get :new
        expect(response).to render_template('new')
      end
      it 'assigns @interview to be a new Interview' do
        get :new
        expect(assigns(:interview)).to be_a_new(Interview)
      end
    end
    context 'when user is not logged in' do
      it 'responds with a status of 302' do
        get :new
        expect(response.status).to eq 302
      end
      it 'redirects to log in ' do
        get :new
        expect(response).to redirect_to login_path
      end
    end
  end

  describe '#create' do
    let!(:valid_interview_attributes) { FactoryGirl.attributes_for(:interview) }
    context 'valid interview information' do
      it 'redirects to interview#show when successful' do
        post :create, params: { interview: valid_interview_attributes }
        expect(response).to redirect_to(interview_path)
      end

      it 'creates a interview' do
        interview_count = Interview.all.count
        post :create, params: { interview: valid_interview_attributes }
        expect(Interview.all.count).to eq(interview_count + 1)
      end
    end
    context 'invalid interview information' do
      it 'does not save a interview with no interviewer_id' do
        missing_interviewer_id = FactoryGirl.attributes_for(:interview, interviewer_id: nil)
        post :create, params: { interview: missing_interviewer_id }
        expect(assigns[:interview].errors).not_to be_empty
      end
      it 'does not save a interview with no applicant_id' do
        missing_applicant_id = FactoryGirl.attributes_for(:interview, applicant_id: nil)
        post :create, params: { interview: missing_applicant_id }
        expect(assigns[:interview].errors).not_to be_empty
      end
      it 'does not save a interview with no challenge_id' do
        missing_challenge_id = FactoryGirl.attributes_for(:interview, challenge_id: nil)
        post :create, params: { interview: missing_challenge_id }
        expect(assigns[:interview].errors).not_to be_empty
      end
      it 'shows the #new view' do
        post :create, params: { interview: { type: 'invalid' } }
        expect(response).to render_template('new')
      end
    end
  end

  xdescribe '#show' do
  end

end
