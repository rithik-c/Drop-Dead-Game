class IncreaseGameOutputLimit < ActiveRecord::Migration[7.0]
  def change
    change_column :auto_drop_deads, :game_output, :longtext
  end
end
