require 'test_helper'

describe UsedTechnology do
  it 'gets added at the end of the list' do
    project = Project.find(1)
    technology = Technology.create(title: 'Ruby')
    used_technology = project.used_technologies.create(technology: technology)

    assert_equal used_technology.sort_order, project.used_technologies.count
  end
end
