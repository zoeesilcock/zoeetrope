require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  it 'gets index' do
    get :index
    assert_response :success
  end

  it 'gets show' do
    get :show, id: 1
    assert_response :success
  end

  describe 'not logged in' do
    it 'redirects from new when not logged in' do
      get :new
      assert_response :redirect
    end

    it 'redirects from new when not logged in' do
      get :edit, id: 1
      assert_response :redirect
    end
  end

  describe 'logged in' do
    let(:project_attributes) { { title: 'Foo', intro: 'Bar' } }

    before do
      login_user(Admin.first)
    end

    it 'gets new when logged in' do
      get :new
      assert_response :success
    end

    it 'creates a project when posting to create' do
      post :create, project: project_attributes
      assert_response :redirect
    end

    it 'gets edit when logged in' do
      get :edit, id: 1
      assert_response :success
    end

    it 'creates a project when posting to create' do
      post :create, project: project_attributes.merge(id: 1)
      assert_response :redirect
    end
  end
end
