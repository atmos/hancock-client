#  thin start -p PORT -R config.ru
require 'ruby-debug'
gem 'sinatra', '~>0.9.1'
require 'lib/sinatra/hancock/sso'
require File.join(File.dirname(__FILE__), 'spec', 'client')

Hancock::Config.configure do |config|
  config.sso_url = 'http://moi.atmos.org/sso'
end

Hancock::Spec::Client.set :environment, :development
run Hancock::Spec::Client
