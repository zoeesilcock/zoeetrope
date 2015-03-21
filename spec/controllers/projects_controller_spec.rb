require 'rails_helper'

RSpec.describe ProjectsController, :type => :controller do
  let(:admin) { create :admin }

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    let!(:project) { create :project }

    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: project

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get :show, id: project

      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    context 'not logged in' do
      it 'responds with a redirect to root' do
        get :new

        expect(response).to redirect_to root_url
      end
    end

    context 'logged in' do
      before do
        login_user admin
      end

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
  end

  describe 'POST #create' do
    let(:project_attributes) { attributes_for :project }

    context 'not logged in' do
      it 'responds with a redirect to root' do
        post :create, project: project_attributes

        expect(response).to redirect_to root_url
      end
    end

    context 'logged in' do
      before do
        login_user admin
      end

      it 'redirects to the newly created project' do
        post :create, project: project_attributes

        project = Project.last
        expect(response).to redirect_to project
      end
    end
  end

  describe 'GET #edit' do
    let(:project) { create :project }

    context 'not logged in' do
      it 'responds with a redirect to root' do
        get :edit, id: project

        expect(response).to redirect_to root_url
      end
    end

    context 'logged in' do
      before do
        login_user admin
      end

      it 'responds successfully with an HTTP 200 status code' do
        get :edit, id: project

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the edit template' do
        get :edit, id: project

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'PUT #update' do
    let(:project) { create :project }
    let(:new_title) { 'Better title' }

    context 'not logged in' do
      it 'responds with a redirect to root' do
        put :update, id: project, project: attributes_for(:project).merge(title: new_title)

        expect(response).to redirect_to root_url
      end
    end

    context 'logged in' do
      before do
        login_user admin
      end

      it 'redirects to the newly created project' do
        put :update, id: project, project: attributes_for(:project).merge(title: new_title)

        expect(project.reload.title).to eq new_title
        expect(response).to redirect_to project
      end
    end
  end
end
