class Technology < ActiveRecord::Base
  validates :title, presence: true

  has_many :used_technologies
  has_many :projects, through: :used_technologies
end
