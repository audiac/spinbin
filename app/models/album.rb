class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :artist, presence: true
  validates :release_year, length: { is: 4 }

  has_many :collection_albums
  has_many :collections, through: :collection_albums
end
