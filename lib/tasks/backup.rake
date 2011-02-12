namespace :backup do
  task :database => :environment do
    sh %%cd #{Rails.root}/script/backup/src/automongobackup.sh%
  end
end
