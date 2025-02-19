namespace :db do
    desc "Remove records older than 30 days"
    task cleanup: :environment do
      YourModel.where('created_at < ?', 30.days.ago).delete_all
      Rails.logger.info "Old records removed."
    end
  end
  