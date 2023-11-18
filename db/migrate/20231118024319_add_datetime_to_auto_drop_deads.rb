class AddDatetimeToAutoDropDeads < ActiveRecord::Migration[7.0]
  def change
    add_column :auto_drop_deads, :datetime, :datetime
  end
end
