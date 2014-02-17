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

    describe 'add technology' do
      it 'creates a technology if a new title is posted' do
        assert_difference 'Technology.count', 1 do
          post :technology, project_id: 1, title: 'Ruby'
        end
      end

      it 'uses an existing technology if an existing title is posted' do
        Technology.create(title: 'Ruby')

        assert_difference 'Technology.count', 0 do
          post :technology, project_id: 1, title: 'Ruby'
        end
      end
    end

    it 'gets technologies' do
      get :technologies, project_id: 1
      assert_response :success
    end

    it 'can changes the order of technologies' do
      put :technologies_order, project_id: 1, order: [2,1]
      assert_response :success

      project = Project.find 1
      assert_equal 2, project.technologies.first.id
      assert_equal 1, project.technologies.last.id
    end

  end
end
