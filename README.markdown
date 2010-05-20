# paperclip_uploadd

Plugin for using Paperclip with [Uploadd](http://github.com/capotej/paperclip_uploadd) as a backend




### Installation
    
    config.gem "httpclient"
    rake gems:install
    script/plugin install git://github.com/capotej/paperclip_uploadd

### Options (all required)

`:storage` set to `::Uploadd`

`:server` url and port of your uploadd server

`:cdn` document root of your uploadd's `UPLOAD_DIR`

`:secret` the secret you set in `SECRET` in uploadd



### Example

     has_attached_file :avatar, :storage => ::Uploadd, :server => "http://uploadd.serbers.com:3000", :secret => "redrum", :cdn => "http://cdn.mysite.com/files"

