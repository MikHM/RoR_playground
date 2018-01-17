class Bookshop::Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
end
