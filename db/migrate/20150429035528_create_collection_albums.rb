class CreateCollectionAlbums < ActiveRecord::Migration
  def change
    create_table :collection_albums do |t|
      t.integer :collection_id, :album_id
    end
  end
end
