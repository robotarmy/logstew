require "whenever/capistrano"
require 'bundler/capistrano'

Dir[File.join(File.dirname(__FILE__),"../lib/capistrano/*.rb")].each {|f| require f}
