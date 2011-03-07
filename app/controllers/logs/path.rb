module Logs
  module Path

    def self.included(base)
      base.class_eval do
        helper_method :new_log_path
        helper_method :logs_path
        helper_method :edit_log_path
      end
    end

    def new_log_path
      if !current_steward.blank?
        new_steward_log_path(current_steward)
      else
        welcome_index_path
      end 
    end

    def logs_path
      if !current_steward.blank?
        steward_logs_path(current_steward)
      else
        welcome_index_path
      end
    end

    def edit_log_path(log)
      if !current_steward.blank?
        edit_steward_log_path(current_steward,log)
      else
        welcome_index_path
      end 
    end

  end
end
