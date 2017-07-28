require 'rails_helper'

describe SessionsController do
  context '#new' do
    it 'renders the sessions#new view' do
      get :new
      expect(response).to render_template('new')
    end
  end

  context '#create' do
    context 'valid user' do
      let!(:user) { FactoryGirl.create(:user, password: 'bob') }
      it 'redirects to root when login successful' do
        post :create, params: { email: user.email, password: 'bob' }
        expect(response).to redirect_to(root_path)
      end
      it 'logs in the user' do
        post :create, params: { email: user.email, password: 'bob' }
        expect(logged_in?).to be true
      end
    end
    context 'invalid user' do
    end
  end

end
