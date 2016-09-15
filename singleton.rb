require 'singleton'

class Application
  include Singleton

  def initialize
    @ip_address = '127.0.0.1'
    @host = 'fatloris'
    @net_mask = '255.255.255.0'
  end

  def info
print <<EOF
#{@host.rjust(20,'_')}
#{@ip_address.rjust(20,'_')}
#{@net_mask.rjust(20,'_')}
EOF
  end
end

APP = Application.instance
APP.info