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
    let!(:user){ FactoryGirl.create(:user) }
    let!(:challenge){ FactoryGirl.create(:challenge) }
    context 'when user is logged in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login_user
      end
      it 'responds with a status of 200' do
        get :new, params: { challenge_id: challenge.id }
        expect(response.status).to eq 200
      end
      it 'renders the Interview#new view' do
        get :new, params: { challenge_id: challenge.id }
        expect(response).to render_template('new')
      end
      it 'assigns @interview to be a new Interview' do
        get :new, params: { challenge_id: challenge.id }
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
    let!(:applicant) { FactoryGirl.create(:user) }
    let!(:interviewer) { FactoryGirl.create(:user) }
    let!(:challenge) { FactoryGirl.create(:challenge) }
    let!(:valid_interview_attributes) { FactoryGirl.attributes_for(:interview, applicant_id: applicant.username) }

    context 'when user is logged in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login_user
      end
      context 'valid interview information' do
        it 'redirects to interview#show when successful' do
          post :create, params: { interview: valid_interview_attributes }
          expect(response).to redirect_to interview_path(assigns(:interview))
        end

        it 'creates a interview' do
          expect{post :create, params: { interview: valid_interview_attributes }}.to change { Interview.all.count }.by 1
        end
      end
      context 'invalid interview information' do
        it 'does not save a interview with no interviewer_id' do
          missing_interviewer_id = FactoryGirl.attributes_for(:interview, interviewer_id: nil, applicant_id: applicant.username)
          expect { post :create, params: { interview: missing_interviewer_id } }.not_to change { Interview.all.count }
        end
        it 'does not save a interview with no applicant_id' do
          missing_applicant_id = FactoryGirl.attributes_for(:interview, applicant_id: nil)
          expect { post :create, params: { interview: missing_applicant_id } }.not_to change { Interview.all.count }
        end
        it 'shows the #new view' do
          post :create, params: { interview: { type: 'invalid', challenge_id: challenge.id } }
          expect(response).to render_template('new')
        end
        it 'assigns @interview with errors' do
          post :create, params: { interview: { type: 'invalid', challenge_id: challenge.id } }
          expect(assigns[:interview].errors).not_to be_empty
        end
      end
    end
    context 'when a user is not logged in' do
      it 'redirects to login' do
        post :create, params: { interview: valid_interview_attributes }
        expect(response).to redirect_to login_path
      end
    end
  end

  describe '#show' do
    let!(:applicant) { FactoryGirl.create(:user) }
    let!(:interviewer) { FactoryGirl.create(:user) }
    let!(:challenge) { FactoryGirl.create(:challenge) }
    let!(:valid_interview_attributes) { FactoryGirl.attributes_for(:interview, applicant_id: applicant.username) }
    let!(:interview) {FactoryGirl.create(:interview)}

    context 'when user is logged in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login_user
      end
      it 'responds with a status of 200' do
        get :show, params: {id: interview.id}
        expect(response.status).to eq 200
      end
      it 'renders the show view' do
        get :show, params: {id: interview.id}
        expect(response).to render_template('show')
      end
    end
    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: {id: interview.id}
        expect(response).to redirect_to login_path
      end
    end
  end

  describe '#update' do
    let!(:applicant) { FactoryGirl.create(:user) }
    let!(:interviewer) { FactoryGirl.create(:user) }
    let!(:challenge) { FactoryGirl.create(:challenge) }
    let!(:interview) {FactoryGirl.create(:interview)}
    before(:each) do
      @user = interviewer
      login_user
    end
    it 'assigns a image_uid' do
      image = fixture_file_upload('files/wb_icon.png', 'image/png')
      patch :update, params: { id: interview.id, interview: { image: image } }
      expect(assigns[:interview].image_uid).not_to be nil
    end
    it 'doesn\'t save a non-image' do
      not_image = fixture_file_upload('files/text.txt', 'text/text')
      patch :update, params: { id: interview.id, interview: { image: not_image } }
      expect(assigns[:interview].image_uid).to be nil
    end
  end
end
