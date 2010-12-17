class OpsController < ApplicationController
  def host
    render :text => %{hostname}
  end
  def git
    render :text => %x{git log HEAD~1..HEAD}
  end
end
