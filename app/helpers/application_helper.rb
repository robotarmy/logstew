module ApplicationHelper

  def is_current_steward?(steward)
    steward && steward == current_steward
  end

  def get_recent_logs
    out = []
    Steward.descending(:last_sign_in_at).limit(10).each do |steward|
      log =  steward.logs.desc(:updated_at).first
      out << log
    end
    out
  end

  def capture_recent_logs
    out = []
     get_recent_logs.each do |log|
      if log
        out << capture do #html_safe
          div_for log do
            link_to(log.creator_name,steward_logs_path(log.steward))
            render({:partial => 'logs/log', :object => log})
          end
        end
      end
    end
    out
  end

  def render_last_posts
    capture_recent_logs.join.html_safe
  end
end
