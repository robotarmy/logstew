class QuestionsController < ApplicationController
  before_filter :authenticate_steward!

  def create
    log = current_steward.logs.find(params[:log_id])
    question = log.questions.build(params[:question].merge(:log => log))
    bang_response(question)
  end

  def answer
    if current_steward.elder?
      question = Question.find(params[:question_id])
      answer = question.answers.build(params[:answer])
      bang_response(answer)
    else
      head :forbidden
    end
  end

  def ditto
    question = Question.find(params[:question_id])
    ditto = Ditto.new(:by => current_steward, :for => question.id, :what => question.class.to_s)
    bang_response(ditto)
  end

  private
  def bang_response(model)
    model.save!
    head :ok
  end
end
