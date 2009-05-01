$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require 'rubygems'
require 'pp'
gem 'rspec', '~>1.2.0'
require 'spec'
gem 'webrat', '~>0.4.2'
require 'webrat'
require 'dm-sweatshop'

gem 'sinatra', '~>0.9.1.3'
require 'sinatra/base'
require 'sinatra/hancock/sso'
gem 'rack-test', '~>0.1.0'
require 'rack/test'

require 'hancock-client'

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)
  config.include(Webrat::Methods)
  config.include(Webrat::Matchers)
  def app
    @app = Rack::Builder.new do
      use Hancock::Client::Default do |sso|
        sso.sso_url = 'http://localhost:20000'
      end
      map '/' do
        run Proc.new {|env| [200, {'Content-Type' => 'text/html', 'Content-Length' => '5'}, ['HELLO']] }
      end
    end
  end
end
