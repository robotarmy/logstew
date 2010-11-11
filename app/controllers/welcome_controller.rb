class WelcomeController < ApplicationController
  def index
    if steward_signed_in?
      redirect_to(logs_path)
      return
    end
  end

end
