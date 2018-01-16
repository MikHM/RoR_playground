class Bookshop::Genre < ApplicationRecord
  validates_presence_of :name

  has_many :books
  has_many :authors, through: :books
end