	require 'expect'
	require 'pty'
def curtis
	PTY.spawn('git -p') do |read,write,pid|
	  write.sync = true
	  $expect_verbose = true
	
	  # If 30 seconds pass and the expected text is not found, the
	  # response object will be nil.
	  read.expect(">") do |response|
	    write.print gets  if response
	  end
	end
end
namespace :g do
  task :cap do
    sh %%git add -p ; true%
    message = 'nolog'
    sh %%git commit -am #{message}%
    sh %%git push origin master%
    sh %%%
  end
end
