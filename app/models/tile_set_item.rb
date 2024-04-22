class TileSetItem < ApplicationRecord
  belongs_to :tile_set
  belongs_to :tile
end
