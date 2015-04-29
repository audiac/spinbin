class CollectionAlbum < ActiveRecord::Base
  belongs_to :collection
  belongs_to :album
end
