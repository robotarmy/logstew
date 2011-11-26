Capistrano::Configuration.instance(:must_exist).load do
  set :whenever_command, "bundle exec whenever"
  set :rvm_type, :user
  set :rvm_ruby_string, 'ruby-1.9.2'
  set :user , :hvf.to_s
  set :use_sudo, false
  set :application, "logstew"
  set :deploy_to, "/home/hvf/deploy/#{application}"
  set :repository,  "git://github.com/robotarmy/logstew.git"
  set :scm, :git
  set :branch, 'master'

  set :git_enable_submodules, 1

  set :git_shallow_clone, 1

  ssh_options[:forward_agent] = true

  role :app, "md1.robotarmymade.com"
  role :db,  "md1.robotarmymade.com"
end
