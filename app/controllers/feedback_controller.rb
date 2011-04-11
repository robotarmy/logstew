class FeedbackController < ApplicationController
  def create
    Feedback.create(params[:feedback])
    redirect_to :back
  end
end
