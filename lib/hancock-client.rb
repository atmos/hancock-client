require 'pp'
require 'rubygems'
gem 'sinatra', '~>0.9.2'
require 'sinatra/base'

gem 'ruby-openid', '>=2.1.7'
require 'openid'
require 'openid/store/memory'
require 'openid/store/filesystem'

gem 'haml', '~>2.0.9'
require 'haml'

require 'tmpdir'

require File.dirname(__FILE__)+'/hancock-client/helpers/rack'
require File.dirname(__FILE__)+'/hancock-client/rack-openid'
require File.dirname(__FILE__)+'/hancock-client/default'
require File.dirname(__FILE__)+'/hancock-client/sso'
require File.dirname(__FILE__)+'/hancock-client/middleware'
require File.dirname(__FILE__)+'/hancock-client/mock_middleware'

OpenID::Util.logger = Logger.new("#{Dir.tmpdir}/hancock.sso.openid.log")
