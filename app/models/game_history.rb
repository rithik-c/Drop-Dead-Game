class GameHistory < ApplicationRecord
  belongs_to :user
  has_one :game_history
end
