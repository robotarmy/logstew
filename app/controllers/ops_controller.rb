class OpsController < ApplicationController
  def host
    render :text => %x{hostname}
  end
  def git
    render :text => %x{git log HEAD~1..HEAD}
  end
end
