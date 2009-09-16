require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'vendor', 'gems', 'environment'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client'))

class HancockClientDemo < Sinatra::Default
  set :views, File.dirname(__FILE__)+'/views'
  set :public, File.dirname(__FILE__)+'/public'

  include Hancock::Client::Helpers::Rack

  use Hancock::Client::Middleware do |sso|
    sso.sso_url = 'http://hancock.atmos.org'
  end

  get '/' do
    haml(:home)
  end
end

run HancockClientDemo
