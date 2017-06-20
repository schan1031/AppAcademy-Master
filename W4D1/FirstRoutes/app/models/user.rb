class User < ApplicationRecord
  validates :username, presence: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :viewed_artwork,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :viewed_artwork,
    source: :artwork

  


end
