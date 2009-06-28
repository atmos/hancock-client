hancock-client
==============

A gem that integrates [sinatra][sinatra] applications into the Hancock SSO
environment.  It also doubles as rack middleware that can be used in 
rails(>= 2.3.2) and sinatra applications.

Dependencies
============
    % sudo geminstaller

testing
=======
Rake works but I'm not 100% sure how to test this correctly

    % sudo gem install rcov rack-test rspec safariwatir cucumber

Application
===========
The goal is to make it simple to write sso enabled apps.

    require 'rubygems'
    require 'hancock-client'
    require 'logger'

    class HancockClientDemo < Sinatra::Default
      set :views,  File.dirname(__FILE__) + '/views'
      set :public, File.dirname(__FILE__) + '/public'
      use Hancock::Client::Default do |sso|
        sso.sso_url = 'http://hancock.atmos.org/sso'
        sso.exclude_paths = %w(/api/)
      end

      get '/' do
        haml(%Q{%h3= "#{sso_user_full_name} - #{sso_user_email}"})
      end
    end

    run HancockClientDemo

[sinatra]: http://www.sinatrarb.com
