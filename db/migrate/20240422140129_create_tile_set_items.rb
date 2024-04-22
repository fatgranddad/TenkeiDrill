class CreateTileSetItems < ActiveRecord::Migration[7.0]
  def change
    create_table :tile_set_items do |t|
      t.references :tile_set, null: false, foreign_key: true
      t.references :tile, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
