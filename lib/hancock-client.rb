gem 'sinatra', '~>0.9.2'
require 'sinatra/base'

gem 'ruby-openid', '>=2.1.6'
require 'openid'
require 'openid/store/memory'

gem 'rack-openid', '>=0.2'
require 'rack-openid'

gem 'haml', '~>2.0.9'
require 'haml'

require 'tmpdir'

require File.dirname(__FILE__)+'/hancock-client/helpers/rack'
require File.dirname(__FILE__)+'/hancock-client/default'
require File.dirname(__FILE__)+'/hancock-client/sso'
require File.dirname(__FILE__)+'/hancock-client/middleware'
require File.dirname(__FILE__)+'/hancock-client/mock_middleware'
