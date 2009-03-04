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
    require 'sinatra/hancock/openid'
    require File.join(File.dirname(__FILE__), 'lib', 'app')

    include Sinatra::Hancock::SSO::Helpers  # something is not right in sinatra

    get '/' do
      pp session
      haml :home
    end

[sinatra]: http://www.sinatrarb.com
