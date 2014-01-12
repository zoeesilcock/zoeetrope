require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  let(:user) { Admin.first }
  let(:login_details) { { email: user.email, password: 'passwd'} }

  it 'signs the user in on create' do
    post :create, login_details
    assert @controller.logged_in?
  end

  it 'signs the user out on destroy' do
    login_user user
    delete :destroy
    refute @controller.logged_in?
  end
end
