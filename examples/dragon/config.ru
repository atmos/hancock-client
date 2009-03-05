#  thin start -p PORT -R config.ru
require 'ruby-debug'
gem 'sinatra', '~>0.9.1'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client'))

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec', 'client'))

Hancock::Spec::Client.sso_configure do |config|
  config.sso_url = 'http://moi.atmos.org/sso'
end

Hancock::Spec::Client.set :views,  'views'
Hancock::Spec::Client.set :public, 'public'
Hancock::Spec::Client.set :environment, :development
run Hancock::Spec::Client
