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
    it 'renders the Interview#new view' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @interview to be a new Interview' do
      get :new
      expect(assigns(:interview)).to be_a_new(Interview)
    end
  end

  xdescribe '#create' do
  end

  xdescribe '#show' do
  end

end












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
        user_count = User.all.count
        post :create, params: { user: valid_user_attributes }
        expect(User.all.count).to eq(user_count + 1)
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
    end
  end
end
