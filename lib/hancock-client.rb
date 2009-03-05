gem 'sinatra', '~>0.9.1'
require 'rack'
require 'sinatra/base'
gem 'dm-core', '~>0.9.10'
require 'dm-core'

gem 'ruby-openid', '>=2.1.2'
require 'openid'

require File.dirname(__FILE__)+'/sinatra/hancock/sso'

module Hancock
  module Client
    class Default < ::Sinatra::Default
      enable :sessions
      cattr_accessor :sso_url

      register Sinatra::Hancock::SSO

      def self.sso_configure(&block)
        yield self
      end
    end
  end
end

