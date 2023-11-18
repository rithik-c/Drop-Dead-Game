class RemoveTimestampsFromAutoDropDeads < ActiveRecord::Migration[7.0]
  def change
    remove_column :auto_drop_deads, :created_at
    remove_column :auto_drop_deads, :updated_at
  end
end
