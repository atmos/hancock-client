require File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'environment')
require File.join(File.dirname(__FILE__), '..', 'lib', 'hancock-client')
require File.join(File.dirname(__FILE__), '..', 'lib', 'hancock-client', 'mock_middleware')

require 'spec'
require 'rack/test'
require 'webrat'
require 'randexp'

Webrat.configure do |config|
  config.mode = :rack
  config.application_framework = :sinatra
  config.application_port = 4567
end

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.include(Webrat::Methods)
  config.include(Webrat::Matchers)
end
