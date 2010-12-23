class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  include Logs::Path

  def after_sign_in_path_for(resource)
    if resource.is_a?(Steward)
      next_sign_in_step(resource)
    else
      super
    end
  end

  def next_sign_in_step(steward)
    if not steward.complete_address?
      new_steward_address_path(steward)
    else
      new_steward_log_path(steward)
    end
  end

  def bang_response(model)
    model.save!
    head :ok
  end

end
