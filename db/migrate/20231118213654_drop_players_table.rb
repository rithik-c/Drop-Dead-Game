class DropPlayersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :players, if_exists: true
  end
end
