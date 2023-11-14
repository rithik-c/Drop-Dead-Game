# Represents a single die with a specified number of sides.
# Responsible for rolling the die.
class Dice
  attr_accessor :num_sides

  # Initializes a new die with the given number of sides.
  def initialize(num_sides)
    @num_sides = num_sides
  end

  # Simulates rolling the die and returns the result.
  def roll_dice
    num = rand(1..@num_sides)
  end
end
