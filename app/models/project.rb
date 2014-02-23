class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :intro, presence: true

  has_many :used_technologies, -> { order('sort_order') }
  has_many :technologies, through: :used_technologies
end
