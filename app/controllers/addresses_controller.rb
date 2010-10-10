class AddressesController < ApplicationController
 before_filter :authenticate_steward!
def new
  if current_steward.address
  	redirect_to(logs_path)
	return
  end
  @address = current_steward.build_address
end
def create
  @address = current_steward.build_address(params[:address])
   respond_to do |format|
      if @address.save
        format.html { redirect_to(new_log_path, :notice => "Address #{@address.name} saved") }
      else
        format.html { render :action => "new" }
      end
    end

end

end
