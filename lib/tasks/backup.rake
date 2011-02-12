namespace :backup do
  task :database => :environment do
    sh %%exec #{Rails.root}/script/backup/src/automongobackup.sh%
  end
end
