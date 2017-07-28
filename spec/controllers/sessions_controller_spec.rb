require 'rails_helper'

describe SessionsController do
  context '#new' do
    it 'renders the sessions#new view' do
      get :new
      expect(response).to render_template('new')
    end
  end

  context '#create' do
    let!(:user) { FactoryGirl.create(:user, password: 'bob') }
    context 'valid user' do
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
      it 'renders the new page' do
        post :create, params: { email: user.email, password: '' }
        expect(response).to render_template('new')
      end
      it 'returns an alert informing the user of failed login' do
        post :create, params: { email: user.email, password: '' }
        expect(flash[:alert]).to match 'Invalid email or password'
      end
      it 'doesn\'t logs in the user' do
        post :create, params: { email: user.email, password: '' }
        expect(logged_in?).to be false
      end
    end
  end

  context '#destroy' do
    before(:each) do
      user = FactoryGirl.create(:user, password: 'bob')
      post :create, params: { email: user.email, password: 'bob' }
    end
    it 'redirects to root' do
      delete :destroy, params: { id: 1 }
      expect(response).to redirect_to root_path
    end
    it 'logs out the user' do
      delete :destroy, params: { id: 1 }
      expect(logged_in?).to be false
    end
  end

end
