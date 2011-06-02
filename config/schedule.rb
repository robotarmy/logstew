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

set :job_template, "/usr/local/bin/rvm-shell -l -c ':job'"

 every 12.hours do
  rake "backup:database"
 end
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
#end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
