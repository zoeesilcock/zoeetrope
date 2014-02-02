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

  let(:license) { 'GPL v3' }

  it 'accepts a license in the form of a string' do
    project = Project.new valid_params.merge(license: license)

    assert project.valid?, 'Not valid with a license.'
    assert_equal project.license, license
  end

  let(:repository) { 'http://github.com/foo/bar' }

  it 'accepts a repository url in the form of a string' do
    project = Project.new valid_params.merge(repository: repository)

    assert project.valid?, 'Not valid with a repository url.'
    assert_equal project.repository, repository
  end

  let(:url) { 'http://foo.bar/download' }

  it 'accepts a download url in the form of a string' do
    project = Project.new valid_params.merge(download_url: url)

    assert project.valid?, 'Not valid with a download url.'
    assert_equal project.download_url, url
  end

  let(:technology) { Technology.first }

  it 'accepts multiple technologies' do
    project = Project.new valid_params

    project.technologies << Technology.all.first
    project.technologies << Technology.all.second
    project.save

    assert project.valid?, 'Not valid with technologies.'
    assert_equal 2, project.technologies.count
  end
end
