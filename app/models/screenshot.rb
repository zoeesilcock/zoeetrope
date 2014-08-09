class Screenshot < ActiveRecord::Base
  before_create :default_sort_order

  mount_uploader :image, ScreenshotUploader
  belongs_to :project

  private

  def default_sort_order
    self.sort_order = project.screenshots.count + 1
  end
end
