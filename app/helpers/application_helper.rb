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
      #
      # In order of preference
      #
      log = steward.logs.where(
        {:image_filename.exists => true,
         :title.exists => true}).desc(:updated_at).first
      log = steward.logs.where(
        {:image_filename.exists => true,
         :title.exists => false}).desc(:updated_at).first if !log
      log = steward.logs.where(
        {:image_filename.exists => false,
         :title.exists => true}).desc(:updated_at).first if !log
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
  
  def og_title(log)
    if log.title.length > 0
      og_title = log.title
    else
      og_title = log.story.split('.')[0]
    end
  end
  
  def og_description(log)
    if log.story.length > 0
      sentences = log.story.split('.')
      og_description = "#{sentences[0..[sentences.length, 1].min].join('.')}."
    else   
      og_description = log.title
    end
    og_description 
  end
  
  def og_image_url(log)
    og_image_url = "http://#{request.env['HTTP_HOST']}/images/stories/hvf_logo_bg_small.png"
    if !log.image.url.nil?
      og_image_url = "http://#{request.env['HTTP_HOST']}#{log.image.url(:fourfifty)}"
    end
    og_image_url
  end
end
