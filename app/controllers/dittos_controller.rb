class DittosController < ApplicationController
  before_filter :authenticate_steward!
  def create
    if Object.const_defined?(params[:what])
      question = Object.const_get(params[:what]).find(params[:for])
      ditto = Ditto.new(:by => current_steward, 
                        :for => question.id, 
                        :what => question.class.to_s)
      bang_response(ditto)
    else
      head :forbidden
    end
  end
  
end
