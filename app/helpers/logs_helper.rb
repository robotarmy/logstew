module LogsHelper
  def logs_title
    "my stewardship journal"
  end
  def disqus_for(log)
    render :partial =>'logs/helper/disqus_for_log', 
      :locals => {:log => log}
  end
end
