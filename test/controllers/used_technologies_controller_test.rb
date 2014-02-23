require 'test_helper'

class UsedTechnologiesControllerTest < ActionController::TestCase
  it 'gets technologies' do
    get :index, project_id: 1
    assert_response :success
  end

  describe 'add technology' do
    it 'creates a technology if a new title is posted' do
      assert_difference 'Technology.count', 1 do
        post :create, project_id: 1, title: 'Ruby'
      end
    end

    it 'uses an existing technology if an existing title is posted' do
      Technology.create(title: 'Ruby')

      assert_difference 'Technology.count', 0 do
        post :create, project_id: 1, title: 'Ruby'
      end
    end
  end

  it 'can changes the order of technologies' do
    put :sort, project_id: 1, order: [2,1]
    assert_response :success

    project = Project.find 1
    assert_equal 2, project.used_technologies.first.id
    assert_equal 1, project.used_technologies.last.id
  end

  it 'can destroy a technology' do
    project = Project.find 1

    assert_difference 'project.technologies.count', -1 do
      delete :destroy, project_id: project.id, id: project.used_technologies.first.id
    end
  end
end
