require 'test_helper'

class StewardTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Steward Factory" do
	assert {
		nil != Factory(:steward)
	}
  end
end
