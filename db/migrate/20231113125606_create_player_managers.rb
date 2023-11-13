class CreatePlayerManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :player_managers do |t|

      t.timestamps
    end
  end
end
