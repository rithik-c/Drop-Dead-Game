class User < ApplicationRecord
  has_one :game_history, dependent: :destroy
end
