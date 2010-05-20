# paperclip_uploadd

Plugin for using Paperclip with [Uploadd](http://github.com/capotej/paperclip_uploadd) as a backend

### Installation

    script/plugin install git://github.com/capotej/paperclip_uploadd

### Options

`:storage` (required) set to `::Uploadd`

`:server` (required) url and port of your uploadd server

`:cdn` (required) document root of your uploadd's `UPLOAD_DIR`

`:secret` (required) the secret you set in `SECRET` in uploadd



### Example

     has_attached_file :avatar, :server => "http://uploadd.serbers.com:3000", :secret => "redrum", :cdn => "http://cdn.mysite.com/files"

