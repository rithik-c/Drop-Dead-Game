class AutoDropDead < ApplicationRecord
  belongs_to :game_history

  before_create :set_datetime

  private

  def set_datetime
    self.datetime = Time.now
  end
end
