class FeedbackController < ApplicationController
  def create
    Feedback.create(params[:feedback])
    head :ok
  end
end
