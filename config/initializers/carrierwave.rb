CarrierWave.configure do |config|
  config.grid_fs_database = "logstew_#{Rails.env}"
  config.grid_fs_host = 'md1.internal'
  config.grid_fs_access_url = "/uploads"
  config.storage = :grid_fs
end

