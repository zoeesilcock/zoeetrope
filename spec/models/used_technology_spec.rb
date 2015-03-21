require 'rails_helper'

RSpec.describe UsedTechnology, type: :model do
  let(:project) { create :project }
  let(:technology) { create :technology }

  it 'gets added to the end of the list' do
    used_technology = project.used_technologies.create(technology: technology)

    expect(used_technology.sort_order).to eq project.used_technologies.count
  end
end
