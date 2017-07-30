require 'rails_helper'

describe UsersController do
  context '#new' do
    it 'renders the User#new view' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @user to be a new User' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context '#create' do
    let!(:valid_user_attributes) { FactoryGirl.attributes_for(:user) }
    context 'valid user information' do
      it 'redirects to root when login successful' do
        post :create, params: { user: valid_user_attributes }
        expect(response).to redirect_to(root_path)
      end

      it 'creates a user' do
        expect{ post :create, params: { user: valid_user_attributes } }.to change{ User.all.count }.by 1
      end

      it 'logs in the user' do
        post :create, params: { user: valid_user_attributes }
        expect(logged_in?).to be true
      end
    end

    context 'invalid user information' do
      it 'does not save a user with no email' do
        missing_email = FactoryGirl.attributes_for(:user, email: '')
        post :create, params: { user: missing_email }
        expect(assigns[:user].errors).not_to be_empty
      end
      missing_first_name = FactoryGirl.attributes_for(:user, first_name: '')
      it 'does not save a user with no first_name' do
        post :create, params: { user: missing_first_name }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with no last_name' do
        missing_last_name = FactoryGirl.attributes_for(:user, last_name: '')
        post :create, params: { user: missing_last_name }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with no username' do
        missing_username = FactoryGirl.attributes_for(:user, username: '')
        post :create, params: { user: missing_username }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with no password' do
        missing_password = FactoryGirl.attributes_for(:user, password: '')
        post :create, params: { user: missing_password }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with a duplicate username' do
        user = FactoryGirl.create(:user)
        duplicate_username = FactoryGirl.attributes_for(:user, username: user.username)
        post :create, params: { user: duplicate_username }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'does not save a user with a duplicate email' do
        user = FactoryGirl.create(:user)
        duplicate_email = FactoryGirl.attributes_for(:user, email: user.email)
        post :create, params: { user: duplicate_email }
        expect(assigns[:user].errors).not_to be_empty
      end
      it 'shows the #new view' do
        post :create, params: { user: { type: 'invalid' } }
        expect(response).to render_template('new')
      end
      it 'assigns @user with errors' do
        post :create, params: { user: { type: 'invalid' } }
        expect(assigns[:user].errors).not_to be_empty
      end
    end
  end

  context '#show' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_user
    end
    it 'assigns @user' do
      get :show, params: { id: @user.id }
      expect(assigns[:user]).to eq @user
    end
    it 'renders the #show view' do
      get :show, params: { id: @user.id }
      expect(response).to render_template :show
    end
  end
end
