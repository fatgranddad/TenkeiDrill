class Tile < ApplicationRecord
  has_many :tile_set_items
  has_many :tile_sets, through: :tile_set_items
  has_one_attached :image  # Active Storageを用いた画像添付
end
