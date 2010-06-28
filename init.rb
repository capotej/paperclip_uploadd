require 'uploadder'

module ::Uploadd
  def self.extended(base)
    base.instance_eval do
      addr = @options[:server] || 'http://127.0.0.1:8080'
      secret = @options[:secret] || ''
      cdn_url = @options[:cdn] || 'http://127.0.0.1:8080/files'
      @path = @options[:path] || ":class/:attachment/:id_partition/:style.:extension"
      if @url == base.class.default_options[:url]
        @url = "#{cdn_url}/#{@path}"
      end

      @uploadder = Uploadder.new(addr, secret)
    end 
  end
  

  def resource_exists?(style)
    res = HTTPClient.head(url(style))
    if res.status_code == 200
      true
    else
      false
    end
  end


  def exists?(style = default_style)
    if original_filename
      resource_exists?(style)
    else
      false
    end
  end

  def get_file(style)
    HTTPClient.get(url(style)).content if exists?(style)
  end

  def flush_writes
    @queued_for_write.each do |style, file|
      log("uploading #{path(style)}")
      @uploadder.transmit(file,path(style))
    end        
    @queued_for_write = {}
  end
  
  def to_file(style = default_style)
    return @queued_for_write[style] if @queued_for_write[style]
    file = Tempfile.new(path(style))
    file.write(get_file(style))
    file.rewind
    return file
  end


  def flush_deletes #:nodoc:
    log("fake deleting (uploadd doesn\'t support deleting)")
    @queued_for_delete = []
  end

end

ActiveRecord::Base.send :include, Uploadd



