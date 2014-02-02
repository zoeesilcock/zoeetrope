class UsedTechnology < ActiveRecord::Base
  belongs_to :project
  belongs_to :technology
end
