require 'test_helper'

describe Technology do
  def valid_params
    { title: 'JavaScript' }
  end

  it 'is valid with a title' do
    technology = Technology.new valid_params

    assert technology.valid?, 'Not valid with a title.'
    assert_equal valid_params[:title], technology.title
  end

  it 'is not valid without a title' do
    technology = Technology.new valid_params.merge(title: nil)

    refute technology.valid?, 'Valid without a title.'
    assert technology.errors[:title], 'Missing error when without title.'
  end
end
