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

  xdescribe '#create' do
    # new_challenge = FactoryGirl.build :challenge
    it 'responds with a status of 302' do
      post :create
      expect(response.status).to eq 302
    end
  end

  xdescribe '#show' do
  end

end
