# Manages the gameplay and logic of the drop-dead dice game.
# Responsible for running an automated game including player management and score tracking.
class AutoDropDead

  # Initializes and plays an automated game using specified parameters
  def play_game(sides, dice_count, player_count)
    
	puts "\n////////////// DROP-DEAD DICE GAME //////////////"
	player_manager = PlayerManager.new
    player_manager.create_players(sides, dice_count, player_count)
	score_manager = ScoreManager.new
	score_manager.create_score_paper(player_count)
	
	# Main game loop
	while player_manager.num_players > 0 do
		current_player = player_manager.get_current_player
		
		current_player.roll_die(score_manager)
		player_manager.update_player

		if current_player.is_dead == true
		  puts "PLAYER #{ current_player.player_id } HAS DROPPED DEAD WITH #{ score_manager.score_paper[current_player.player_id] } PTS!"
		else
		  player_manager.switch_player_turn 
		end
		
	end

	score_manager.determine_winner
	score_manager.display_score_paper
  end
end
