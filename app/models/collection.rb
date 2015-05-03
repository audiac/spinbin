class Collection < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 80 }

  has_many :collection_albums, dependent: :destroy
  has_many :albums, through: :collection_albums

  has_many :collection_users, dependent: :destroy
  has_many :users, through: :collection_users
end
