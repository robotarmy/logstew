class LogsController < ApplicationController
  include CarrierWave::MiniMagick
  before_filter :authenticate_steward! , :except => [:show]
  before_filter :steward

  def steward
    @steward ||= Steward.find(params[:steward_id])
  end

  def index
    @logs =  steward.logs.descending(:updated_at)
  end

  def new
    @log = current_steward.logs.new
    @steward = @log.steward
  end

  def show
    @log = Log.find(params[:id])
    if @log.title.length > 0 || @log.story.length > 0
      render :layout => 'full_og'
    else  
      render :layout => 'full' 
    end
  end

  def edit
    @log = Log.find(params[:id])
    @steward = @log.steward
    unless @log
      redirect_to(welcome_index_path)
    end
  end

  def update
    # update/ edit are short circuited to your own logs
    @log = current_steward.logs.find(params[:id])
    @steward = @log.steward

    if @log.update_attributes(params[:log])
      redirect_to(logs_path, :notice => 'Log was successfully created.') 
    else
      render :action => "edit" ,:notice => ':( something went wrong'
    end
  end 

  def create
    @log = current_steward.logs.build(params[:log])
    @steward = @log.steward
    if @log.save!
      redirect_to(logs_path, :notice => 'Log was successfully created.') 
    else
      render :action => "new" ,:errors => @log.errors
    end
  end 

  def destroy
    backtrace
    logger.info(params)
  end

end
