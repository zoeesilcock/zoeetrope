require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let(:admin) { create :admin }

  describe 'GET #new' do
    it 'responds successfully with an HTTP 200 status code' do
      get :new

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'signs the user in' do
      post :create, { email: admin.email, password: attributes_for(:admin)[:password] }

      expect(subject.logged_in?).to be_truthy
    end
  end

  describe 'GET #destroy' do
    before do
      login_user admin
    end

    it 'signs the user out' do
      get :destroy

      expect(subject.logged_in?).to be_falsy
    end
  end
end
