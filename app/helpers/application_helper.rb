module ApplicationHelper
  def render_last_posts
    out = ""
    Steward.desc(:last_sign_in_at).limit(10).each do |n|
      log =  n.logs.desc(:updated_at).first
      if log
        out << render({:partial => 'logs/log', :object => log}).html_safe
      end
    end
    out.html_safe
  end
end
