class CollectionAlbum < ActiveRecord::Base
  belongs_to :collection
  belongs_to :album, dependent: :destroy
end
