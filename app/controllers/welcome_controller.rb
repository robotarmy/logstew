class WelcomeController < ApplicationController
  def index
    #TODO can this be written as a before filter
    if steward_signed_in?
      redirect_to(logs_path)
      return
    end
  end
end
