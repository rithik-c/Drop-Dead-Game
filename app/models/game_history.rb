class GameHistory < ApplicationRecord
    belongs_to :user
    has_many :auto_drop_deads
  end
  