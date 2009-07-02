require 'pp'
require 'rubygems'
gem 'rspec', '~>1.2.0'
require 'spec'
gem 'webrat', '~>0.4.4'
require 'webrat'
require 'dm-sweatshop'

gem 'rack-test', '~>0.4.0'
require 'rack/test'

require File.join(File.dirname(__FILE__), '..', 'lib', 'hancock-client')
require File.join(File.dirname(__FILE__), '..', 'lib', 'hancock-client', 'mock_middleware')

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.include(Webrat::Methods)
  config.include(Webrat::Matchers)
end
