class GridFs
  def initialize(app)
      @app = app
  end

  def call(env)
    Rails.logger.info env['PATH_INFO']
    if env["PATH_INFO"] =~ /^\/grid\/(.+)$/
      process_request(env, $1)
    else
      @app.call(env)
    end
  end

  private  
  def process_request(env, key)
    begin
      Mongo::GridFileSystem.new(Mongoid.database).open(key, 'r') do |file|
        [200, { 'Content-Type' => file.content_type }, [file.read]]
      end
    rescue
      [404, { 'Content-Type' => 'text/plain' }, ['Grid File not found.']]
    end
  end
end


