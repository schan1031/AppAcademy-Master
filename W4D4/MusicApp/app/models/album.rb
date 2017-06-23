class Album < ApplicationRecord
  validates :band_id, :name, :year, presence: true
  validates :name, uniqueness: { scope: :band_id }

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band

  has_many :tracks,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Track


end
