namespace :one_time do
  task :upload_to_grid_fs => :environment do
    dir = {}
    Dir["#{Rails.root}/public/uploads/log/image/*/*"].each do |file|
      name = File.basename(file)
      dirname  = File.dirname(file)
      if !name.blank?
        curname = (dir[dirname] ||= "")
        if curname.length < 1 or curname.length > name.length
          dir[dirname] = name
        end
      end
    end
    dir.each do |dir,file|
      original_file = File.join(dir, file)
      mf = MoveFileToGridFs.new(original_file)
      begin
        mf.update(:grid)
      rescue Exception => e
        puts e.message
      end
      puts "#[#{mf.local_path}]::#{mf.exists_as?(:grid)}"
    end
  end
end
