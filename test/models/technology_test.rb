require 'test_helper'

describe Technology do
  def valid_params
    { title: 'Ruby' }
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

  it 'must have a unique title' do
    existing_title = Technology.all.first.title
    technology = Technology.new title: existing_title

    refute technology.valid?, 'Valid with duplicate title.'
    assert technology.errors[:title], 'Missing error with dublicate title.'
  end
end
