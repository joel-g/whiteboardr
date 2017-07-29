require 'rails_helper'

describe ChallengesController do
  describe '#new' do
    context 'Logged in' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login_user
        get :new
      end
      it 'assigns @challenge to a new challenge' do
        expect(assigns(:challenge)).to be_a_new(Challenge)
      end
      it 'Renders the new page' do
        expect(response).to render_template :new
      end
    end
    context 'Logged out' do
      it 'redirects to login page if user is not logged in' do
        get :new
        expect(response).to redirect_to login_path
      end
    end

  end

  describe '#create' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_user
    end

    context 'Valid challenge' do
      let!(:valid_challenge){ FactoryGirl.attributes_for(:challenge) }

      it 'redirects to root' do
        post :create, params: { challenge: valid_challenge }
        expect(response).to redirect_to root_path
      end
      it 'creates a challenge' do
        expect{ post :create, params: { challenge: valid_challenge } }.to change { Challenge.all.count }.by(1)
      end
    end

    context 'Invalid challenge' do
      it 'does not save a challenge with no title' do
        no_title = FactoryGirl.attributes_for(:challenge, title: nil)
        expect{ post :create, params: { challenge: no_title } }.not_to change { Challenge.all.count }
      end
      it 'does not save a challenge with no body' do
        no_body = FactoryGirl.attributes_for(:challenge, body: nil)
        expect{ post :create, params: { challenge: no_body } }.not_to change { Challenge.all.count }
      end
      it 'does not save a challenge with no difficulty' do
        no_difficulty = FactoryGirl.attributes_for(:challenge, difficulty: nil)
        expect{ post :create, params: { challenge: no_difficulty } }.not_to change { Challenge.all.count }
      end
      it 'renders the challenges#new view' do
        post :create, params: { challenge: { type: 'invalid' } }
        expect(response).to render_template :new
      end
      it 'assigns @challenge with errors' do
        post :create, params: { challenge: { type: 'invalid' } }
        expect(assigns[:challenge].errors).not_to be_empty
      end
    end
  end

end
