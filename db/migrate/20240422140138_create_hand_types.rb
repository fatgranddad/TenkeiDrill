class CreateHandTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :hand_types do |t|
      t.string :name
      t.integer :han
      t.text :description

      t.timestamps
    end
  end
end
