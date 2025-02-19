class DropPlayerManagersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :player_managers, if_exists: true
  end
end
