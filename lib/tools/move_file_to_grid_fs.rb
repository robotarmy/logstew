class MoveFileToGridFs
  attr_accessor :local_path

  def initialize(local_path)
    self.local_path = local_path
  end

  def exists_as?(where)
    send("exists_as_#{where.to_s}")
  end

  def update(where)
    send("update_#{where.to_s}")
  end

  def log_id
    @log_id ||= self.local_path.split('log/image/').last.split('/').first
  end

  def log
    @log ||= begin
      steward = nil
      begin
        ob_id = BSON::ObjectId(log_id)
      rescue Exception => e
        return e.message
      end
      steward = Steward.find(:first, :conditions => {"logs._id" => ob_id})
      if steward
        steward.logs.where('_id' => ob_id).first
      else 
        "steward not found for #{log_id}"
      end
    end
  end

  private

  def exists_as_file
    File.exists?(self.local_path)
  end

  def gridfs_path
    "uploads/log/image/#{log.id}/#{log.image_filename}"
  end

  def exists_as_grid
    begin
      exists = false
      gridfs_file = Mongo::GridFileSystem.new(Mongoid.database).open(gridfs_path, 'r')
      gridfs_file.read
      exists = true
    rescue Exception
    end
    exists
  end

  def data
    @tempfile ||= begin
                    Rack::Test::UploadedFile.new(self.local_path)
                  end
  end
  def update_grid
    log.update_attributes(:image => data)
  end
end
