class Bookshop::Genre < ApplicationRecord
  validates_presence_of :name
end