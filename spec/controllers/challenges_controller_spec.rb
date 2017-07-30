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
      let!(:valid_tag){ FactoryGirl.attributes_for(:tag) }
      let!(:challenge){ FactoryGirl.create(:challenge) }
      it 'redirects to root' do
        post :create, params: { challenge: valid_challenge }
        expect(response).to redirect_to root_path
      end
      it 'creates a challenge' do
        expect{ post :create, params: { challenge: valid_challenge } }.to change { Challenge.all.count }.by(1)
      end
      it 'creates a tag, if tag was entered and does not exist' do
        valid_challenge[:tag] = valid_tag
        p valid_tag
        p valid_challenge
        expect{ post :create, params: { challenge: valid_challenge }  }.to change { Tag.all.count }.by(1)
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

  context '#index' do
    let! (:user) {FactoryGirl.create(:user)}
    let! (:challenge_easy) {FactoryGirl.create(:challenge, difficulty: 'easy')}
    let! (:challenge_medium) {FactoryGirl.create(:challenge, difficulty: 'medium')}
    let! (:challenge_hard) {FactoryGirl.create(:challenge, difficulty: 'hard')}
    context 'no filters specified' do
      before(:each) do
        get :index
      end
      it 'renders the index view' do
        expect(response).to render_template :index
      end
      it 'assigns @challenges to all challenges' do
        expect(assigns[:challenges]).to match_array(Challenge.all)
      end
    end
    context 'difficulty filter specified' do
      it 'renders the index view' do
        get :index, params: {difficulty: ['easy','hard']}
        expect(response).to render_template :index
      end
      it 'assigns @challenges to challenges matching the specified difficulties' do
        get :index, params: {difficulty: ['easy','hard']}
        expect(assigns[:challenges]).to match_array([challenge_easy,challenge_hard])
      end
      it 'assigns @challenges to challenges matching one specified difficulties' do
        get :index, params: {difficulty: ['medium']}
        expect(assigns[:challenges]).to match_array([challenge_medium])
      end
    end
  end

end
