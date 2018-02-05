class CreateBookshopGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshop_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
