# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
#
# RVM patch
#
job_type :rvm_rake,    "cd :path && RAILS_ENV=:environment rvm-shell rake :task :output"

 every 12.hours do
  rvm_rake "backup:database"
 end
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
#end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
