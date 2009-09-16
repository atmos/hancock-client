require 'pp'
require 'tmpdir'
require 'sinatra/base'

require 'openid'
require 'openid/store/memory'
require 'openid/store/filesystem'

require 'haml'

require File.dirname(__FILE__)+'/hancock-client/helpers/rack'
require File.dirname(__FILE__)+'/hancock-client/rack-openid'
require File.dirname(__FILE__)+'/hancock-client/default'
require File.dirname(__FILE__)+'/hancock-client/sso'
require File.dirname(__FILE__)+'/hancock-client/middleware'
require File.dirname(__FILE__)+'/hancock-client/mock_middleware'

OpenID::Util.logger = Logger.new("#{Dir.tmpdir}/hancock.sso.openid.log")
