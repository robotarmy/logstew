class LogsController < ApplicationController
 before_filter :authenticate_steward!
 def index
    @logs =  current_steward.logs.descending(:updated_at)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end

  # GET /logs/new
  # GET /logs/new.xml
  def new
    @log = current_steward.logs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end
  # GET /logs/:id
  # GET /logs/:id.xml
  def show
    Steward.criteria.id(params[:steward_id]).each do  |a|
      @log = a.logs.find(params[:id])
    end
    respond_to do |format|
      format.html { render :layout => 'show' }
      format.xml  { render :xml => @log }
    end
  end
  # POST /logs
  # POST /logs.xml
  def create
    @log = current_steward.logs.build(params[:log])
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
