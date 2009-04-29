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

    % sudo gem install sinatra hancock haml

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

    # OpenID writes to STDERR by default.  This is closed under passenger so
    # to make this reliable you should have openid write failures somewhere.
    OpenID::Util.logger = Logger.new(Dir.tmpdir + "/openid.log")

    class HancockClientDemo < Sinatra::Default
      set :views,  File.dirname(__FILE__) + '/views'
      set :public, File.dirname(__FILE__) + '/public'
      use Hancock::Client::Default do |sso|
        sso.sso_url = 'http://hancock.atmos.org/sso'
      end

      get '/' do
        haml(%Q{%h3= "#{session[:first_name]} #{session[:last_name]} - #{session[:email]}"})
      end
    end

    run HancockClientDemo

[sinatra]: http://www.sinatrarb.com
