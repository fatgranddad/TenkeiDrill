class TilesController < ApplicationController
  before_action :set_tile_set

  def create
    @tile = @tile_set.tiles.create(tile_params)
    if @tile.save
      redirect_to @tile_set, notice: 'Tile was successfully added.'
    else
      redirect_to @tile_set, alert: 'Failed to add tile.'
    end
  end

  def destroy
    @tile = @tile_set.tiles.find(params[:id])
    @tile.destroy
    redirect_to @tile_set, notice: 'Tile was successfully removed.'
  end

  private

  def set_tile_set
    @tile_set = TileSet.find(params[:tile_set_id])
  end

  def tile_params
    params.require(:tile).permit(:name, :category, :value, :image)
  end
end