$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require 'rubygems'
require 'pp'
gem 'rspec', '~>1.1.12'
require 'spec'
gem 'webrat', '~>0.4.2'
require 'webrat'
require 'dm-sweatshop'

gem 'sinatra', '~>0.9.1'
require 'sinatra/base'
require 'sinatra/test'
require 'sinatra/hancock/sso'

require File.dirname(__FILE__)+'/client'

Spec::Runner.configure do |config|
  config.include(Sinatra::Test)
  config.include(Webrat::Methods)
  config.include(Webrat::Matchers)
  config.before(:each) do
    @app = Rack::Builder.new do
      run Hancock::Spec::Client
    end
  end
end
