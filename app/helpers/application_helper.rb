module ApplicationHelper

  def is_current_steward?(steward)
    steward && steward == current_steward
  end
  
  def capture_if_current_steward_is(steward)
    if is_current_steward?(steward)
      capture do
        yield
      end
    end
  end


  def render_last_posts
    capture_recent_logs.join.html_safe
  end

  def get_recent_logs
    out = []
    Steward.descending(:last_sign_in_at).limit(10).each do |steward|
      log = steward.logs.any_of(
        {:image_filename.exists => true,
         :title.exists => false},
        {:image_filename.exists => false,
         :title.exists => true},
        ).desc(:updated_at).first

      out << log if log
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
            # 
            # why doesn't
            #  'render log' 
            # work?
            #
            render({:partial => 'logs/log', :object => log})
          end
        end
      end
    end
    out
  end
end
