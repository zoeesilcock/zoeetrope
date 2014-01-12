require 'test_helper'

describe Project do
  def valid_params
    { title: 'Foo', intro: 'Bar' }
  end

  it 'is valid with valid params' do
    project = Project.new valid_params

    assert project.valid?, 'Can not create with valid params: #{project.errors.messages}'
  end

  it 'is not valid without a title' do
    project = Project.new valid_params.merge(title: nil)

    refute project.valid?, 'Not valid without a title.'
    assert project.errors[:title], 'Missing error when without title.'
  end

  it 'is not valid without a intro' do
    project = Project.new valid_params.merge(intro: nil)

    refute project.valid?, 'Not valid without a intro.'
    assert project.errors[:intro], 'Missing error when without intro.'
  end
end
