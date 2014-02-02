class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :intro, presence: true

  has_many :used_technologies
  has_many :technologies, through: :used_technologies
end
