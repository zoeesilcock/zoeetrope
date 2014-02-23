require 'test_helper'

describe UsedTechnology do
  it 'gets added at the end of the list' do
    project = Project.find 1
    technology = Technology.create(title: 'Ruby')
    used_technology = UsedTechnology.create(project: project, technology: used_technology)

    assert_equal used_technology.sort_order, project.used_technologies.count
  end
end
