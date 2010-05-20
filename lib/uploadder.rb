require 'httpclient'
class Uploadder

  def initialize(addr, secret)
    @addr = addr + '/up'
    @secret = secret
  end

  def transmit(file, filename)
    res = HTTPClient.post @addr, { :file => File.new(file.path), :filename => filename, :secret => @secret }
    unless res.status_code == 200
      raise "Invalid Uploadd server or password"
    end
  end
  
end
