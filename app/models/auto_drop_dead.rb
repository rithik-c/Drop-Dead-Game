class AutoDropDead < ApplicationRecord
  belongs_to :game_history
  
  # Add a created_at field
  before_create :set_created_at

  private

  def set_created_at
    self.created_at = Time.now
  end
end
