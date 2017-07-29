require 'rails_helper'

describe ChallengesController do
  describe '#new' do
    it 'responds with a status of 302 if user is not logged in' do
      get :new
      expect(response.status).to eq 302
    end
    it 'redirects to login page if user is not logged in' do
      get :new
      expect(response).to redirect_to login_path
    end
    xit 'response with a status of 200 if user is logged in' do

      expect(response.status).to eq 200
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
