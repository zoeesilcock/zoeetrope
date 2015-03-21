require 'rails_helper'

RSpec.describe Technology, type: :model do
  let(:technology) { build :technology }

  it 'requires a title' do
    technology.title = nil

    expect(technology).not_to be_valid
  end

  it 'requires a unique title' do
    create :technology

    expect(technology).not_to be_valid
  end
end
