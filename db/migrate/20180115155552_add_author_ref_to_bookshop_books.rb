class AddAuthorRefToBookshopBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookshop_books, :author, foreign_key: true
  end
end
