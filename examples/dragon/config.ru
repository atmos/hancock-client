#  thin start -p PORT -R config.ru
gem 'sinatra', '~>0.9.1.1'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client'))

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec', 'client'))

class ConsumerApp < Hancock::Spec::Client
  set :sso_url, 'http://hancock.atmos.org/sso'

  set :views,  'views'
  set :public, 'public'
  set :environment, :development
end

run ConsumerApp
