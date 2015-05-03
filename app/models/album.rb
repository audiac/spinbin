class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true

  has_many :collection_albums, dependent: :destroy
  has_many :collections, through: :collection_albums
end
