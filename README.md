hancock-client
==============

A gem that integrates [sinatra][sinatra] applications into the 
[Hancock SSO][hancocksso] environment.  It also doubles as rack middleware that
can be used in rails(>= 2.3.2) and sinatra applications.

Dependencies
============
    % sudo gem install bundler

testing
=======
Rake works for basic stuff, there's safariwatir for integration.

    % gem bundle
    % bin/rake

For the integration tests you'll need to be on a mac,

    % bin/rake example

Application
===========
The goal is to make it simple to write sso enabled apps.

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
* Use the Issues Page on Github for Questions

[sinatra]: http://www.sinatrarb.com
[hancocksso]: http://www.github.com/atmos/hancock/
