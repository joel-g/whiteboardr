require 'rails_helper'

describe FaqsController do
  describe '#index' do
    it 'renders the faqs#index template' do
      get :index
      expect(response).to render_template :index
    end
  end
end
