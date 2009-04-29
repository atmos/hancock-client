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

      set :sso_url, nil

      def sso_url=(url)
        options.sso_url = url
      end

      register Sinatra::Hancock::SSO

      get '*' do
        if session[:user_id]
          forward
        else
          session[:return_to] = request.path_info
          redirect "#{options.sso_url}/login?return_to=#{absolute_url('/sso/login')}"
        end
      end
    end
  end
end
