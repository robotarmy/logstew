Capistrano::Configuration.instance(:must_exist).load do
after "deploy:symlink","deploy:logstew_symlink"
after "deploy", "rvm:trust_rvmrc"

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
   start_unicorn_cmd = "cd #{deploy_to}/current && bundle exec unicorn -c #{deploy_to}/current/config/unicorn.rb -E production -D config.ru"

   task :restart, :roles => :app do
     run "kill -USR2 `cat #{deploy_to}/shared/pids/unicorn.pid` || #{start_unicorn_cmd}"
   end
   task :start, :roles => :app do
     run start_unicorn_cmd
   end
   task :stop, :roles => :app do
     run "kill -QUIT `cat #{deploy_to}/shared/pids/unicorn.pid`"
   end
 end

 #http://beginrescueend.com/integration/capistrano/
 namespace :rvm do
   task :trust_rvmrc do
      run "rvm rvmrc trust #{release_path}"
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
end
