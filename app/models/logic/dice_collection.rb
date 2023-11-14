module Logic
  # Represents a collection of dice.
  # Responsible for managing a group of dice including keeping track of rolls every turn, and adding/removing dice.
  class DiceCollection

    # Initializes a new empty dice collection and current rolls collection
    def initialize
      @dice_collection = []
      @current_rolls = []
    end

    # Adds a specified number of dice with a given number of sides to the collection.
    def add_dice(num_dice, num_sides)
      num_dice.times do
        @dice_collection << Dice.new(num_sides)
      end
    end

    # Removes a die from the collection.
    def remove_dice
      @dice_collection.pop
    end

    # Gets a specific die from the collection.
    def get_dice(index)
      @dice_collection[index]
    end

    # Gets the number of dice in the collection.
    def num_dice
      @dice_collection.length
    end

    # Adds a roll result to the current_rolls collection.
    def add_roll(roll_num)
      @current_rolls << roll_num
    end
    
    # Gets and clears the current roll results.
    def get_rolls
      rolls_text = @current_rolls.join(' ')
      @current_rolls = []
      return rolls_text
    end

  end
end
