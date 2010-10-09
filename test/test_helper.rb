ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "wrong"
class ActiveSupport::TestCase
 include Wrong
end
