class CreateGameHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :game_histories do |t|
      t.references :user, foreign_key: true
    end
  end
end
