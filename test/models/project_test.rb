require 'test_helper'

describe Project do
  def valid_params
    { title: 'Best project', intro: 'This is the greates and best project in the world... Tribute.' }
  end

  let(:license) { 'GPL v3' }
  let(:repository) { 'http://github.com/zoeesilcock/best_project' }
  let(:url) { 'http://zoeetrope.com/download' }

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

  it 'accepts a license in the form of a string' do
    project = Project.new valid_params.merge(license: license)

    assert project.valid?, 'Not valid with a license.'
    assert_equal project.license, license
  end

  it 'accepts a repository url in the form of a string' do
    project = Project.new valid_params.merge(repository: repository)

    assert project.valid?, 'Not valid with a repository url.'
    assert_equal project.repository, repository
  end

  it 'accepts a download url in the form of a string' do
    project = Project.new valid_params.merge(download_url: url)

    assert project.valid?, 'Not valid with a download url.'
    assert_equal project.download_url, url
  end

  it 'accepts a featured flag in the form of a boolean' do
    project = Project.new valid_params.merge(featured: true)

    assert project.valid?, 'Not valid with a featured flag.'
    assert_equal project.featured, true
  end
end
