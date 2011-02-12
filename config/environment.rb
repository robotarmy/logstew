# Load the rails application
require File.expand_path('../application', __FILE__)
Haml::Template.options[:attr_wrapper]     = '"'
Sass::Plugin.options[:style]              = :compressed
Sass::Plugin.options[:template_location]  = (Rails.root + 'app' + 'sass').to_s
Sass::Plugin.options[:css_location]       = (Rails.root + 'public' + 'stylesheets').to_s
# Initialize the rails application
#  config.metals = ["Gridfs"]
Logstew::Application.initialize!
