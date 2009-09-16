hancock-client
==============

A gem that integrates [sinatra][sinatra] applications into the Hancock SSO
environment.  It also doubles as rack middleware that can be used in 
rails(>= 2.3.2) and sinatra applications.

Dependencies
============
    % sudo gem install bundler

testing
=======
Rake works for basic stuff, there's safariwatir for integration.

    % gem bundle
    % bin/rake

For the integration you need to be running a local application

    % cd examples/dragon
    % ../../bin/rackup config.ru -p  -p 4567

In another shell run the following from the root of the project

    % bin/rake features

Application
===========
The goal is to make it simple to write sso enabled apps.

    require 'rubygems'
    require 'hancock-client'

    class HancockClientDemo < Sinatra::Default
      set :views,  File.dirname(__FILE__) + '/views'
      set :public, File.dirname(__FILE__) + '/public'
      use Hancock::Client::Middleware do |sso|
        sso.sso_url = 'http://hancock.atmos.org/sso'
        sso.exclude_paths = %w(/api/)
      end

      get '/' do
        haml(:home)
      end
    end
    run HancockClientDemo

Feedback
========
* [Google Group][googlegroup]

[sinatra]: http://www.sinatrarb.com
[googlegroup]: http://groups.google.com/group/hancock-users
