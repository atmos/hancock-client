gem 'sinatra', '~>0.9.2'
require 'sinatra/base'

gem 'ruby-openid', '>=2.1.6'
require 'openid'

gem 'rack-openid', '>=0.2'
require 'rack-openid'

gem 'haml', '~>2.0.9'
require 'haml'

require File.dirname(__FILE__)+'/middleware'
require File.dirname(__FILE__)+'/helpers/rack'

module Hancock
  module Client
    class Default < ::Sinatra::Base
      enable :sessions
      disable :raise_errors
      disable :show_exceptions

      set :sso_url, nil
      set :exclude_paths, nil

      def sso_url=(url)
        options.sso_url = url
      end

      def exclude_paths=(paths)
        options.exclude_paths = paths
      end
      register ::Hancock::SSO
    end
  end
end
