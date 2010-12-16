set :rvm_type, :system
set :rvm_ruby_string, 'ruby-1.9.2' 
set :user , :hvf.to_s
set :use_sudo, false
set :application, "logstew"
set :deploy_to, "/home/hvf/deploy/#{application}"
set :repository,  "git://github.com/robotarmy/logstew.git"
set :scm, :git
set :branch, 'master'

#set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true

#role :web, "proxy.logstew.robotarmymade.com"                          # Your HTTP server, Apache/etc
role :app, "app.logstew.robotarmymade.com"
role :db,  "master.db.logstew.robotarmymade.com",:no_release => true, :primary => true # This is where Rails migrations will run

after "deploy:symlink","deploy:logstew_symlink"


 namespace :deploy do
  %w(start stop restart).each do |action|   
     desc "unicorn:#{action}"    
     task action.to_sym do  
        find_and_execute_task("unicorn:#{action}")  
     end  
   end 
   task :logstew_symlink do
  run <<-CMD
      ln -nfs #{shared_path}/system/uploads #{release_path}/public/uploads
    CMD
	end

 end

 namespace :unicorn do
   task :restart, :roles => :app do
     run "kill -USR2 `cat #{deploy_to}/shared/pids/unicorn.pid`"  
   end
   task :start, :roles => :app do
     run "cd #{deploy_to}/current && bundle exec unicorn -c #{deploy_to}/current/config/unicorn.rb -E production -D config.ru"  
   end
   task :stop, :roles => :app do
     run "kill -QUIT `cat #{deploy_to}/shared/pids/unicorn.pid`"  
   end
 end

 #http://595959.javaeye.com/blog/713912
 namespace :log do  
   desc "Tail the Rails log..."  
   task :tail, :roles => :app do  
     run "tail -f #{deploy_to}/current/log/production.log" do |channel, stream, data|  
       puts  # for an extra line break before the host name  
       puts "#{channel[:server]} -> #{data}"   
       break if stream == :err      
     end  
   end  
 end  
