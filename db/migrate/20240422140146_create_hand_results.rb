class CreateHandResults < ActiveRecord::Migration[7.0]
  def change
    create_table :hand_results do |t|
      t.references :tile_set, null: false, foreign_key: true
      t.references :hand_type, null: false, foreign_key: true
      t.integer :fu
      t.integer :han
      t.integer :points

      t.timestamps
    end
  end
end
