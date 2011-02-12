	require 'expect'
	require 'pty'
def expects(cmd)
	PTY.spawn(cmd) do |read,write,pid|
	  write.sync = true
	  $expect_verbose = true
	
	  # If 30 seconds pass and the expected text is not found, the
	  # response object will be nil.
	  read.expect(">") do |response|
	    write.print response  if response
	  end
	end
end
namespace :g do
  task :cap do
    sh %%bundle%
    sh %%echo 'do g:cap'%
    sh %%cd script/backup ; git add -p ; git commit -am 'backup' ; git push origin master ;%
    sh %%git add -p ; true%
    message = 'nolog'
    sh %%git commit -am #{message}%
    sh %%git push origin master%
    sh %%cap deploy%
    sh %%echo 'end g:cap'%
  end
end
