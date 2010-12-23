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
    if not @log
      @log_id ||= self.local_path.split('log/image/').last.split('/').first 
    else
      @log_id = nil
      log.id
    end
  end

  def log
    @log ||= begin
      steward = Steward.find(:first, :conditions => {"logs._id" => log_id})
      steward.logs.where('_id' => log_id).first
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
    gridfs_file = Mongo::GridFileSystem.new(Mongoid.database).open(gridfs_path, 'r')
    gridfs_file.read
    true
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
