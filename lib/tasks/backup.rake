namespace :backup do
  task :database => :environment do
    sh %%sh #{Rails.root}/script/backup/src/automongobackup.sh%
  end
end
