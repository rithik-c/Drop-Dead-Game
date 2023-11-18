class AddGameOutputToAutoDropDeads < ActiveRecord::Migration[7.0]
  def change
    add_column :auto_drop_deads, :game_output, :string
  end
end
