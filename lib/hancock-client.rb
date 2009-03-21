gem 'sinatra', '~>0.9.1'
require 'rack'
require 'sinatra/base'
gem 'dm-core', '~>0.9.10'
require 'dm-core'

gem 'ruby-openid', '>=2.1.2'
require 'openid'

gem 'haml', '~>2.0.9'
require 'haml'

require File.dirname(__FILE__)+'/sinatra/hancock/sso'

module Hancock
  module Client
    class Default < ::Sinatra::Default
      enable :sessions
      set :sso_url, nil

      register Sinatra::Hancock::SSO
    end
  end
end
