class CommentsController < ApplicationController
  before_filter :steward, :log, :body

  def new_comment(log)
      Comment.create!(:author => current_steward,
                      :log => log,
                      :body => body)
  end

  def log
    @log ||= Log.find(params[:comment][:log_id])
  end

  def body
    @body ||= params[:comment][:body]
  end

  def create
    new_comment(log)
    redirect_to steward_log_path(log.steward,log) 
  end
end

