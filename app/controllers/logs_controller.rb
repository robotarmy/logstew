class LogsController < ApplicationController
 before_filter :authenticate_steward! , :except => [:show]
 def index
    @steward = Steward.find(params[:steward_id])
    @logs =  @steward.logs.descending(:updated_at)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @log = current_steward.logs.new
    @steward = @log.steward
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def show
    Steward.criteria.id(params[:steward_id]).each do  |a|
      @log = a.logs.find(params[:id])
      @steward = @log.steward
    end
    respond_to do |format|
      format.html { render :layout => 'full' }
    end
  end

  def edit
    @log = current_steward.logs.find(params[:id])
    @steward = @log.steward
    if @log
      respond_to do |format|
        format.html
      end
    else 
      redirect_to(welcome_index_path)
    end
  end

  def update
    # update/ edit are short circuited to your own logs
    @log = current_steward.logs.find(params[:id])
    @steward = @log.steward

    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to(logs_path, :notice => 'Log was successfully created.') }
      else
        format.html { render :action => "edit" ,:notice => ':( something went wrong'}
      end
    end
  end 

  def create
    @log = current_steward.logs.build(params[:log])
    @steward = @log.steward
    respond_to do |format|
      if @log.save
        format.html { redirect_to(logs_path, :notice => 'Log was successfully created.') }
      else
        format.html { render :action => "new" ,:notice => 'Nope'}
      end
    end
  end 

  def destroy
     backtrace
     logger.info(params)
  end

end
