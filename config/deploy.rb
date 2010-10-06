###
default_run_options[:pty] = true
set :use_sudo, false
set :application, "logstew"
set :deploy_to, "/home/hvf/deploy/#{application}"
set :repository,  "git://github.com/robotarmy/logstew.git"
set :scm, :git
set :branch, 'master'
set :scm_verbose, true
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

role :web, "proxy-logstew.robotarmymade.com"                          # Your HTTP server, Apache/etc
role :app, "app-logstew.robotarmymade.com"                          # This may be the same as your `Web` server
role :db,  "master-db-logstew.robotarmymade.com", :primary => true # This is where Rails migrations will run
#role :db,  ""

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end