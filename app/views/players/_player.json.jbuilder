json.extract! player, :id, :player_id, :is_dead, :created_at, :updated_at
json.url player_url(player, format: :json)
