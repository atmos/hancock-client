gem 'sinatra', '~>0.9.1.3'
require 'rack'
require 'sinatra/base'

gem 'ruby-openid', '>=2.1.6'
require 'openid'

gem 'haml', '~>2.0.9'
require 'haml'

require File.dirname(__FILE__)+'/sinatra/hancock/sso'

module Hancock
  module Client
    class Default < ::Sinatra::Base
      enable :sessions
      disable :raise_errors
      disable :show_exceptions

      set :sso_url, nil

      def sso_url=(url)
        options.sso_url = url
      end

      register Sinatra::Hancock::SSO
    end
  end
end
