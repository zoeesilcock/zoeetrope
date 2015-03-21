require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'requires an email address' do
    admin = build :admin, email: nil
    expect(admin).to_not be_valid
  end
end
