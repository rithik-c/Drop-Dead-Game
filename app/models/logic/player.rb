# Represents a player in the dice game.
# Responsible for the gameplay of a player's turn.
class Player

  # Unique identifier for the player.
  attr_reader :player_id
  # Collection of dice held by the player.
  attr_reader :dice_collection
  # Flag indicating if the player is out of the game.
  attr_accessor :is_dead

  # Initializes a new player with a unique ID and an empty dice collection.
  def initialize(player_id)
    @player_id = player_id
    @is_dead = false
    @dice_collection = DiceCollection.new
  end

  # Simulates rolling dice for the player.
  # Manages the player's dice collection and updates player score accordingly 
  def roll_die(score_manager)
    dead_dice = false
    num_dead_dice = 0
    num_dice = dice_collection.num_dice

    puts "\n----- Player #{ @player_id }'s turn -----"

    while !dead_dice do
      score = 0
      for index in 0...num_dice
        current_dice = dice_collection.get_dice(index)
        roll = current_dice.roll_dice
        dice_collection.add_roll(roll)

        if roll == 2 || roll == 5
          dead_dice = true
          num_dead_dice += 1
        else
          score += roll
        end

      end
      
      # Removing dice with 2 or 5
      if dead_dice
        score = 0
        num_dead_dice.times do 
          dice_collection.remove_dice
          num_dice -= 1
        end
      else
        score_manager.update_score(player_id, score)
      end
      
      # Displaying result
      puts "Player #{ @player_id } rolled #{ num_dice } dice: #{ dice_collection.get_rolls }"
      puts "Roll Score: #{ score } | Dice Remaining: #{ num_dice }"
      puts "+---------------------------------+"
      
    end

    score
  end
  
end
