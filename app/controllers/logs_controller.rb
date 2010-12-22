class LogsController < ApplicationController
 before_filter :authenticate_steward! , :except => [:show]
 def index
    @steward = Steward.find(params[:steward_id])
    @logs =  @steward.logs.descending(:updated_at)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @logs }
    end
  end

  def new
    @log = current_steward.logs.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @log }
    end
  end

  def show
    Steward.criteria.id(params[:steward_id]).each do  |a|
      @log = a.logs.find(params[:id])
    end
    respond_to do |format|
      format.html { render :layout => 'full' }
      format.xml  { render :xml => @log }
    end
  end

  def edit
    # This is neat - as there is an implied security check
    # as the edit link is encoded with the current_steward 
    # and the specific log id
    Steward.criteria.id(params[:steward_id]).each do  |a|
      @log = a.logs.find(params[:id])
    end
    if @log  # not found
      respond_to do |format|
        format.html
        format.xml  { render :xml => @log }
      end
    else 
      redirect_to(welcome_index_path)
    end
  end

  def update
    Steward.criteria.id(params[:steward_id]).each do  |a|
      @log = a.logs.find(params[:id])
    end
    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to(logs_path, :notice => 'Log was successfully created.') }
      else
        format.html { render :action => "edit" ,:notice => 'Nope'}
      end
    end
  end 

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
