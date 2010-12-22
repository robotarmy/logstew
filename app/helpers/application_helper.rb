module ApplicationHelper
  def render_last_posts
    out = ""
    Steward.desc(:last_sign_in_at).limit(10).each do |n|
      log =  n.logs.desc(:updated_at).first
      if log
        name = log.steward.address.public_name || log.steward.address.name || "Anonymous"
        out << link_to(name,steward_logs_path(log.steward)).html_safe
        out << render({:partial => 'logs/log', :object => log}).html_safe
      end
    end
    out.html_safe
  end
end
