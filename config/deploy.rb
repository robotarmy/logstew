Dir[File.join(File.dirname(__FILE__),"../lib/capistrano/*.rb")].each {|f| require f}
require 'bundler/capistrano'
require "whenever/capistrano"
