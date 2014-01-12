require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  let(:user) { Admin.first }
  let(:login_details) { { email: user.email, password: 'passwd'} }

  it 'gets the login form' do
    get :new
    assert_response :success
  end

  it 'signs the user in on create' do
    post :create, login_details
    assert @controller.logged_in?
  end

  it 'signs the user out via get' do
    login_user user
    get :destroy
    refute @controller.logged_in?
  end
end
