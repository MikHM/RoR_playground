class Skill < ApplicationRecord
  validates_presence_of :title, :percent_spent_on
end
