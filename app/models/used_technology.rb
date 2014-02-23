class UsedTechnology < ActiveRecord::Base
  before_create :default_sort_order

  belongs_to :project
  belongs_to :technology

  private

  def default_sort_order
    self.sort_order = project.used_technologies.count + 1
  end
end
