namespace :db do
  desc "Remove all records from users, game_histories, and auto_drop_deads"
  task cleanup: :environment do
    AutoDropDead.delete_all
    GameHistory.delete_all
    User.delete_all

    Rails.logger.info "All records removed from users, game_histories, and auto_drop_deads."
  end
end
