class AddressesController < ApplicationController
  before_filter :authenticate_steward!

  def new
    @address = current_steward.build_address
  end

  def create
    @address = current_steward.build_address(params[:address])
    respond_to do |format|
      if @address.save!
        format.html { redirect_to(after_sign_in_path_for(current_steward), :notice => "Welcome #{@address.public_name}") }
      else
        format.html { render :action => "new" }
      end
    end
  end
end
