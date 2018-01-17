class CreateBookshopBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshop_books do |t|
      t.string :title
      t.integer :year
      t.text :summary

      t.timestamps
    end
  end
end
