class AddGenreRefToBookshopBooks < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookshop_books, :genre, foreign_key: true
  end
end
