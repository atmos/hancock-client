require 'pp'
require 'tmpdir'
require 'sinatra/base'
require 'json'

require 'openid'
require 'openid/store/memory'
require 'openid/store/filesystem'

require 'haml'

module Hancock
  module Client
    def self.libdir
      @libdir ||= File.expand_path(File.dirname(__FILE__))
    end
  end
end

require File.join(Hancock::Client.libdir, 'hancock-client', 'helpers', 'rack')
require File.join(Hancock::Client.libdir, 'hancock-client', 'rack-openid')
require File.join(Hancock::Client.libdir, 'hancock-client', 'default')
require File.join(Hancock::Client.libdir, 'hancock-client', 'sso')
require File.join(Hancock::Client.libdir, 'hancock-client', 'middleware')
require File.join(Hancock::Client.libdir, 'hancock-client', 'mock_middleware')

require File.join(Hancock::Client.libdir, 'hancock-api')

OpenID::Util.logger = Logger.new("#{Dir.tmpdir}/hancock.sso.openid.log")
