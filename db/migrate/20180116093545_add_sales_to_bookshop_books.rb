class AddSalesToBookshopBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :bookshop_books, :sales, :integer
  end
end
