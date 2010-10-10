module LogsHelper
  def logs_title
	"Practice Log for #{current_steward.address.try(:name)}"
  end
end
