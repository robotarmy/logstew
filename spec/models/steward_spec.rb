require 'spec_helper'

describe Steward do
	assert {
		nil != Factory(:steward)
	}
end

