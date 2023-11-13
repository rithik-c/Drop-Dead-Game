class CreateAutoDropDeads < ActiveRecord::Migration[7.0]
  def change
    create_table :auto_drop_deads do |t|
      t.integer :sides
      t.integer :dice_count
      t.integer :player_count

      t.timestamps
    end
  end
end
