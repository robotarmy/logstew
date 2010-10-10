class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if resource.is_a?(Steward)
	if resource.address.blank?
		new_address_path
	else
		new_log_path
	end
    else
      super
    end
  end
end
