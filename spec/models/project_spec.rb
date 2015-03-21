require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build :project }

  it 'requires a title' do
    project.title = nil
    expect(project).not_to be_valid
  end

  it 'requires an intro' do
    project.intro = nil
    expect(project).not_to be_valid
  end

  it 'can have technologies' do
    technology = build :technology

    project.technologies << technology

    expect(project.technologies).to include technology
  end

  it 'can have screenshots' do
    screenshot = build :screenshot

    project.screenshots << screenshot

    expect(project.screenshots).to include screenshot
  end
end
