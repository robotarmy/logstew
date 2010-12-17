 deploy_path = '/home/hvf/deploy/logstew/'  
 shared_path = '/home/hvf/deploy/logstew/shared'  
 app_path = deploy_path + 'current'  

 stderr_path shared_path + "/log/unicorn.stderr.log"
 stdout_path shared_path + "/log/unicorn.stdout.log"  
 worker_processes 1  
   
 working_directory app_path  
   
 listen shared_path + '/system/unicorn.sock', :backlog => 2048  
   
 timeout 30  
   
 pid_file = shared_path + '/pids/unicorn.pid'  
 pid pid_file  
   
 preload_app true  
   
 before_fork do |server, worker|  
   old_pid = pid_file + '.oldbin'  
   if File.exists?(old_pid) && server.pid != old_pid  
     begin  
       Process.kill("QUIT", File.read(old_pid).to_i)  
     rescue Errno::ENOENT, Errno::ESRCH  
     end  
   end  
 end
 after_fork do |server,worker|
   #TODO: Mongoid reconnect replica set support
 end
