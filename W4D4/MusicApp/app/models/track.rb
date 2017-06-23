class Track < ApplicationRecord
  validates :album_id, :lyrics, :name, presence: true
  validates :bonus, includion: { in: [true, false] }

  belongs_to :album,
   primary_key: :id,
   foreign_key: :album_id,
   class_name: :Album

  has_one :band,
    through: :album,
    source: :band
end
