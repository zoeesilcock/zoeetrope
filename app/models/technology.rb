class Technology < ActiveRecord::Base
  validates :title, presence: true
end
