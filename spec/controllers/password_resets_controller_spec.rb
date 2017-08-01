require 'rails_helper'

describe PasswordResetsController do

  context '#update' do
    let!(:valid_user_attributes) { FactoryGirl.attributes_for(:user) }
    context 'valid user information' do
      it 'redirects to root when login successful' do
        post :update, params: { user: { password: valid_user_attributes[:password], password_confirmation: valid_user_attributes[:password]} }
        expect(response).to redirect_to(root_path)
      end

      it 'logs in the user' do
        post :update, params: { user: valid_user_attributes }
        expect(logged_in?).to be true
      end
    end

      it 'does not save a user with no password' do
        missing_password = FactoryGirl.attributes_for(:user, password: '')
        missing_password[:password_confirmation] = ''
        post :update, params: { user: missing_password }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with a password_confirmation that differs from password' do
        missing_password = FactoryGirl.attributes_for(:user)
        missing_password[:password_confirmation] = 'not_password'
        post :update, params: { user: missing_password }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with a password that is less than three characters' do
        short_password = FactoryGirl.attributes_for(:user, password: 'pw')
        short_password[:password_confirmation] = 'pw'
        post :update, params: { user: short_password }
        expect(assigns[:user].errors).not_to be_empty
      end

      it 'shows the #index view' do
        post :update, params: { user: { type: 'invalid' } }
        expect(response).to render_template('index')
      end
      it 'assigns @user with errors' do
        post :update, params: { user: { type: 'invalid' } }
        expect(assigns[:user].errors).not_to be_empty
      end
    end


  xcontext '#edit' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_user
    end
    it 'assigns @user' do
      get :edit, params: { id: @user.id }
      expect(assigns[:user]).to eq @user
    end
    it 'renders the #edit view' do
      get :edit, params: { id: @user.id }
      expect(response).to render_template :edit
    end
    it 'redirects to root if the currently logged in user isn\'t the user being editted' do
      user = FactoryGirl.create(:user)
      get :edit, params: { id: user.id }
      expect(response).to redirect_to root_path
    end
  end

  xcontext '#edit' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_user
    end
    it 'shows the #edit view' do
      missing_last_name = FactoryGirl.attributes_for(:user, last_name: '')
      patch :update, params: { user: missing_last_name, id: @user.id }
      expect(response).to render_template('edit')
    end
    it 'assigns @user with errors' do
      missing_last_name = FactoryGirl.attributes_for(:user, last_name: '')
      patch :update, params: { user: missing_last_name, id: @user.id }
      expect(assigns[:user].errors).not_to be_empty
    end
    it 'redirects to root if the currently logged in user isn\'t the user being editted' do
      user = FactoryGirl.create(:user)
      get :update, params: { user: FactoryGirl.attributes_for(:user), id: user.id }
      expect(response).to redirect_to root_path
    end
  end
end
