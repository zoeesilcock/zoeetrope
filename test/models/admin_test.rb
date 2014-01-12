require 'test_helper'

class AdminTest < ActiveSupport::TestCase

  def valid_params
    { email: 'admin@zoeetrope.com' }
  end

  it 'is valid with valid params' do
    admin = Admin.new valid_params

    assert admin.valid?, 'Can not create with valid params: #{admin.errors.messages}'
  end

  it 'is not valid without an email' do
    admin = Admin.new valid_params.merge(email: nil)

    refute admin.valid? 'Not valid without an email.'
    assert admin.errors[:enail], 'Missing error when without email.'
  end
end
