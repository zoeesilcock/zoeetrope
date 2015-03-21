require 'rails_helper'

RSpec.describe UsedTechnologiesController, :type => :controller do
  let(:project) { create :project}

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index, format: :json, project_id: project

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index, format: :json, project_id: project

      expect(response).to render_template('index')
    end
  end

  describe 'POST #create' do
    context 'new title' do
      it 'creates a new technology' do
        expect do
          post :create, format: :json, project_id: project, title: 'New technology'
        end.to change { Technology.count }.by 1
      end
    end

    context 'existing title' do
      let!(:technology) { create :technology }

      it 'uses the existing technology' do
        expect do
          post :create, format: :json, project_id: project, title: technology.title
        end.not_to change { Technology.count }
      end
    end
  end

  describe 'PUT #sort' do
    let!(:technology) { create :technology }
    let!(:another_technology) { create :technology, title: 'Rspec' }

    before do
      project.technologies << technology
      project.technologies << another_technology
    end

    it 'changes the order of the technologies' do
      put :sort, format: :json, project_id: project, order:
        [project.used_technologies.last.id, project.used_technologies.first.id]

      project.reload
      expect(project.used_technologies.first.technology.id).to eq another_technology.id
      expect(project.used_technologies.last.technology.id).to eq technology.id
    end
  end

  describe 'DELETE #destroy' do
    let!(:technology) { create :technology }

    before do
      project.technologies << technology
    end

    it 'removes the technology' do
      expect do
        delete :destroy, format: :json, project_id: project, id: project.used_technologies.first
      end.to change { UsedTechnology.count }.by -1
    end
  end
end
