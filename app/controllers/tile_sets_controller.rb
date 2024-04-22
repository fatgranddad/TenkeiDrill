class TileSetsController < ApplicationController
  before_action :set_tile_set, only: [:show, :edit, :update, :destroy]

  def index
    @tile_sets = TileSet.all
  end

  def new
    @tile_set = TileSet.new
  end

  def create
    @tile_set = TileSet.new(tile_set_params)
    if @tile_set.save
      redirect_to @tile_set, notice: 'Tile set was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tile_set.update(tile_set_params)
      redirect_to @tile_set, notice: 'Tile set was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tile_set.destroy
    redirect_to tile_sets_url, notice: 'Tile set was successfully destroyed.'
  end

  private

  def set_tile_set
    @tile_set = TileSet.find(params[:id])
  end

  def tile_set_params
    params.require(:tile_set).permit(:description, :user_id)  # 編集可能なパラメータを適宜調整
  end
end