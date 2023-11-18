module Logic
  # Creates and manages players in the game.
  # Responsible for creating and managing players, tracking the current player, and switching turns.
  class PlayerManager

    # Initializes a new empty player collection
    def initialize
      @all_players = []
    end

    # Creates and adds players with initialized dice collections to the player collection.
    def create_players(sides, dice_count, num_players)
      for index in 1..num_players do
        temp_player = Player.new(index)
        temp_player.dice_collection.add_dice(dice_count, sides)
        @all_players << temp_player
      end
    end

    # Gets the number of players still in the game.
    def num_players
      @all_players.length
    end

    # Gets the current player whose turn it is.
    def get_current_player
      @all_players[0]
    end

    # Switches the turn to the next player in the player collection.
    def switch_player_turn
      if num_players > 1
        current_player = @all_players.shift
        @all_players << current_player
      end
    end

    # Checks and updates the current player if they are out of the game.
    def update_player
      current_player = get_current_player
      remaining_dice = current_player.dice_collection.num_dice
      if remaining_dice == 0
        current_player.is_dead = true
        @all_players.shift
      end
    end

  end
end