class CreateTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :tiles do |t|
      t.string :name
      t.string :category
      t.integer :value
      t.string :image_path

      t.timestamps
    end
  end
end
