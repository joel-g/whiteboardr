require 'rails_helper'

describe PasswordResetsController do
  let!(:user) {FactoryGirl.create(:user)}
  context '#create' do
    it 'redirects to root' do
      post :create, params: {email: user.email}
      expect(response).to redirect_to root_path
    end
    it 'sets the flash alert' do
      post :create, params: {email: user.email}
      expect(flash[:alert]).not_to be nil
    end
  end
  context '#edit' do
    it 'renders the edit view with valid token' do
      user.generate_reset_password_token!
      token = user.reset_password_token
      get :edit, params: { id: token }
      expect(response).to render_template :edit
    end
    it 'redirects to root with invalid token' do
      get :edit, params: { id: 'garbage_token' }
      expect(response).to redirect_to login_path
    end
  end
  let!(:user2) {FactoryGirl.create(:user)}
  context '#update' do
    it 'it changes the password' do
      user2 = FactoryGirl.create(:user)
      user2.generate_reset_password_token!
      token = user2.reset_password_token
      post :update, params: {id: token, user: {password: 'newpassword', password_confirmation: 'newpassword'}}
      user2.reload
      expect(user2.valid_password?('pwd')).to be false
    end
    it 'assigns an alert' do
      user.generate_reset_password_token!
      token = user.reset_password_token
      post :update, params: {id: token, user: {password: 'newpassword', password_confirmation: 'newpassword'}}
      expect(flash[:alert]).not_to be nil
    end
    it 'redirects to root with invalid token' do
      post :update, params: {id: 'garbage_token', user: {password: 'newpassword', password_confirmation: 'newpassword'}}
      expect(response).to redirect_to login_path
    end
    it 'renders edit on invalid password change' do
      user.generate_reset_password_token!
      token = user.reset_password_token
      post :update, params: {id: token, user: {password: 'password', password_confirmation: 'otherpassword'}}
      expect(response).to render_template :edit
    end
  end
end
