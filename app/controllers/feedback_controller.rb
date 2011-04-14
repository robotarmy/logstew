class FeedbackController < ApplicationController
  before_filter :authenticate_steward!, :except => [:create]
  def create
    Feedback.create(params[:feedback])
    redirect_to :back
  end

  def index
    @feedback = Feedback.all()
  end
end
