class RemoveTimestampsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :created_at
    remove_column :users, :updated_at
  end
end
