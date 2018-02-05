class CreateBookshopAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshop_authors do |t|
      t.string :name
      t.string :alias
      t.string :country
      t.text :biography

      t.timestamps
    end
  end
end
