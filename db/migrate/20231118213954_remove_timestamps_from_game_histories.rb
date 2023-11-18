class RemoveTimestampsFromGameHistories < ActiveRecord::Migration[7.0]
  def change
    remove_column :game_histories, :created_at
    remove_column :game_histories, :updated_at
  end
end
