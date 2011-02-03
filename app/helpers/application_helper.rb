module ApplicationHelper

  #TODO: push render_last_posts into a partial
  def render_last_posts
    out = ""
    Steward.desc(:last_sign_in_at).limit(10).each do |n|
      log =  n.logs.desc(:updated_at).first
      if log
        out = capture do #html_safe
          div_for log do
            link_to(log.creator_name,steward_logs_path(log.steward))
            render({:partial => 'logs/log', :object => log})
          end
        end
      end
    end
    out
  end
end
