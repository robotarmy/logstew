class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  include Logs::Path
  def after_sign_in_path_for(resource)
    if resource.is_a?(Steward)
      if resource.address.blank?
        new_steward_address_path(resource)
      elsif resource.address.public_name.blank? ||
            resource.address.public_location_name.blank?
        new_steward_address_path(resource)
      else
        new_steward_log_path(resource)
      end
    else
      super
    end
  end

  def bang_response(model)
    model.save!
    head :ok
  end

end
