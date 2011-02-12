require File.expand_path('../boot', __FILE__)
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"


# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Logstew
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib/tools)
    config.plugins = [ :all ]
    config.middleware.use 'GridFs'
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.generators do |g|
     g.orm :mongoid
     g.template_engine :haml # haml-rails
     g.test_framework :rspec, :fixture_replacement => :factory_girl
    end
  end
end
