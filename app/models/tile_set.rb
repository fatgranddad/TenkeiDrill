class TileSet < ApplicationRecord
  belongs_to :user
  has_many :tile_set_items, dependent: :destroy
  has_many :tiles, through: :tile_set_items
  has_many :hand_results, dependent: :destroy
end
