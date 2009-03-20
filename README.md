hancock-client
==============

A gem that integrates [sinatra][sinatra] applications into the Hancock SSO
environment.  It also doubles as rack middleware that can be used in 
rails(>= 2.3.2) and merb(>= 1.0)

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
    require 'hancock-client'

    run Hancock::Client
    class ConsumerApp < Hancock::Client::Default
      set :sso_url, 'http://hancock.atmos.org/sso'

      set :views,  'views'
      set :public, 'public'
      set :environment, :production

      get '/' do
      redirect '/login' unless session[:user_id]
      haml(<<-HAML
              %h3= "#{session[:first_name]} #{session[:last_name]} - #{session[:email]}"
              HAML
          )
      end
    end

    run ConsumerApp

[sinatra]: http://www.sinatrarb.com
