module Logic
  # Manages and tracks the scores of players in the game.
  # Responsible for all score-related tasks including creating and updating player scores, determining the winner, and displaying the scoreboard.
  class ScoreManager

    # Constants representing player IDs and points in the score paper.
    ID = 0
    POINTS = 1

    # Stores player scores
    attr_reader :score_paper
    attr_accessor :roll_score

    # Initializes the score manager with an empty score paper and winner.
    def initialize
      @roll_score = 0
      @score_paper = {}
      @winner = []
      @ties = {}
    end

    # Creates an entry in the score paper for each player.
    def create_score_paper(numPlayers)
      for id in 1..numPlayers do
        @score_paper[id] = 0
      end
    end

    # Updates the score of a specific player.
    def update_score(id, new_score)
      @score_paper[id] += new_score
    end

    # Determines the player(s) with the highest score and sets them as the winner.
    def determine_winner
      @score_paper = Hash[@score_paper.sort_by { |_, score| -score }]
      @winner = @score_paper.first

      @score_paper.each do |key, value|
        if value == @winner[1]
          @ties[key] = value
        end
      end
    end

    # Displays the scoreboard showing each player's score.
    def display_score_paper
      score_padding = (13 - length(@winner[POINTS]) - length(@winner[ID])) / 2.0
      winner_padding = (21 - @winner[ID].to_s.length) / 2.0
      border = "+#{ '-' * 33 }+"

      Logic.game_output = Logic.game_output + "\n\n#{ border }"
      Logic.game_output = Logic.game_output + "\n|           SCOREBOARD            |"
      Logic.game_output = Logic.game_output + "\n|           ----------            |"
      
      # Getting all player points listings
      @score_paper = Hash[@score_paper.sort_by { |_, score| -score }]
      @score_paper.each do |key, value|
        left_padding = score_padding.ceil + length(@winner[POINTS]) - length(value)
        right_padding = 33 - (left_padding + length(value) + 20 + length(key))
        Logic.game_output = Logic.game_output + "\n|#{ ' ' * left_padding }#{ value }PTS          Player #{ key }#{ ' ' * right_padding }|"
      end


      Logic.game_output = Logic.game_output + "\n|#{ ' ' * 33 }|"
      if @ties.length > 1
        # Handling ties
        tie_message = "Players "
        counter = 1
        @ties.each do |key, value|
          tie_message += "#{key}"
          if counter != @ties.length
            tie_message += " & "
          end
          counter += 1
        end
        tie_message += " Tied!"

        tie_padding = (33 - tie_message.length) / 2.0
        Logic.game_output = Logic.game_output + "\n|#{ ' ' * tie_padding.ceil }#{tie_message}#{ ' ' * tie_padding.floor }|"
      else
        Logic.game_output = Logic.game_output + "\n|#{ ' ' * winner_padding.ceil }Player #{ @winner[ID] } Won!#{ ' ' * winner_padding.floor }|"
      end
      Logic.game_output = Logic.game_output + "\n#{ border }\n\n"
    end

    # Helper fxn that calculates the length of a number when converted to a string.
    def length(number)
      number.to_s.length.to_i
    end

  end
end
