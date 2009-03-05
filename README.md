hancock_client_sinatra
==============

A gem that integrates [sinatra][sinatra] applications into the Hancock SSO environment

Dependencies
============
    % gem sources
    *** CURRENT SOURCES ***

    http://gems.rubyforge.org
    % sudo gem sources -a http://gems.github.com
    http://gems.github.com added to sources

    % sudo gem install sinatra-sinatra 
    % sudo gem install atmos-hancock

testing
=======
Rake works but I'm not 100% sure how to test this correctly

Application
===========
The goal is to make it simple to write sso enabled apps.

    require 'rubygems'
    require 'sinatra'
    require 'sinatra/base'
    require 'sinatra/hancock/client/sso'
    Hancock::Config.configure do |config|
      config.sso_url = 'http://moi.atmos.org/sso'
    end

    module Hancock
      class Client < Sinatra::Default
        register Sinatra::Hancock::SSO
        enable :sessions
        set :environment, :test

        get '/' do
          redirect '/login' unless session[:user_id]
          haml(<<-HAML
%h3= "#{session[:first_name]} #{session[:last_name]} - #{session[:email]}"
HAML
          )
        end
      end
    end
    run Hancock::Client

[sinatra]: http://www.sinatrarb.com
