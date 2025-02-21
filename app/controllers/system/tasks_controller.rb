module System
  class TasksController < ApplicationController

    def cleanup
      if params[:secret] == ENV["CLEANUP_SECRET"]
        system("rake db:cleanup")

        render plain: "Cleanup job executed!", status: :ok
      else
        render plain: "Unauthorized", status: :unauthorized
      end
    end
  end
end
