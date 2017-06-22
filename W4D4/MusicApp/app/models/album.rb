class Album < ApplicationRecord
  validates :band_id, :name, :year, presence: true
  validates :name, uniqueness: { scope: :band_id }
end
