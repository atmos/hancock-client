#  thin start -p PORT -R config.ru
require 'tmpdir'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client'))
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'helpers', 'rack'))

class HancockClientDemo < Sinatra::Default
  set :views, File.dirname(__FILE__)+'/views'
  set :public, File.dirname(__FILE__)+'/public'

  include Hancock::Helpers::Rack

  use Hancock::Client::Default do |sso|
    sso.sso_url = 'http://hancock.atmos.org/sso'
  end

  get '/' do
    haml(%Q{%h3= "#{sso_user_full_name} - #{sso_user_email}"})
  end
end

run HancockClientDemo
