class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :intro, presence: true
end
