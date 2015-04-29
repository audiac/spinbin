class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.integer :release_year
      t.string :catalog_number
      t.string :record_label

      t.timestamps
    end
  end
end
