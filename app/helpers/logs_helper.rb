module LogsHelper
  def log
    @log
  end
  def logs
    @logs
  end


  def logs_title_for(steward)
    if is_current_steward?(steward)
      link_to "my stewardship journal", steward_logs_path(steward)
    else
      link_to "#{steward.name.capitalize}'s stewardship journal", steward_logs_path(steward)
    end
  end
  
  def new_comments_for(log)
    render :partial => 'comments/new', :locals => {:log => log}
  end
  
  def comments_for(log)
    render log.comments
  end

  def edit_for(log)
    capture_if_current_steward_is(log.steward) do
      link_to('edit', edit_log_path(log), :class => 'edit')
    end
  end

  def size
    case controller.action_name.to_s.to_sym
      when :index then
        :thumb
      when :show then
        :fourfifty
      else
        :thumb
      end
  end

  def image_for(log)
    image_url = log.image.url(size)
    if image_url
      link_to(image_tag(image_url),
              steward_log_path(log.steward,log), 
              :class => size )
    end
  end

  def title_for(log)
    title = log.title
    if size == :thumb
      title = link_to(log.title,
        steward_log_path(log.steward,log))
    end
    title
  end

  def story_for(log)
    log_story = log.story
    if size == :thumb
      log_story = link_to(truncate(log_story,:length => 100),
        steward_log_path(log.steward,log))
    end
    log_story
  end

  def name_for(log)
    link_to log.steward.name, steward_logs_path(log.steward)
  end

  def date_for(log)
    log.created_at.to_formatted_s(:long_ordinal) 
  end
end
