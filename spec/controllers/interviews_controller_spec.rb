require 'rails_helper'

describe InterviewsController do
  describe '#index' do
    it 'responds with a status of 200' do
      get :index
      expect(response.status).to eq 200
    end
  end

  xdescribe '#new' do
  end

  xdescribe '#create' do
  end

  xdescribe '#show' do
  end

end
