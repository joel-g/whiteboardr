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
    let!(:valid_challenge){ FactoryGirl.attributes_for(:challenge) }

    context 'Valid challenge' do
      it 'redirects to root' do
        post :create, params: { challenge: valid_challenge }
        expect(response).to redirect_to root_path
      end
      it 'creates a challenge' do
        expect{ post :create, params: { challenge: valid_challenge } }.to change { Challenge.all.count }.by(1)
      end
    end

    context 'Invalid challenge' do
    end
  end

end
