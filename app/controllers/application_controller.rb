class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if resource.is_a?(Steward)
      if resource.address.blank?
        new_steward_address_path(resource)
      else
        new_steward_log_path(resource)
      end
    else
      super
    end
  end
  def new_log_path
    if !current_steward.blank?
      new_steward_log_path(current_steward)
    else
      welcome_index_path
    end 
  end
  helper_method :new_log_path
  def logs_path
    if !current_steward.blank?
      steward_logs_path(current_steward)
    else
      welcome_index_path
    end 
  end
  helper_method :logs_path
  def edit_log_path(log)
    if !current_steward.blank?
      edit_steward_log_path(current_steward,log)
    else
      welcome_index_path
    end 
  end
  helper_method :edit_log_path
end
