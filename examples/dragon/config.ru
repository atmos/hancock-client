#  thin start -p PORT -R config.ru
require 'tmpdir'
require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client'))

class HancockClientDemo < Sinatra::Default
  set :views, File.dirname(__FILE__)+'/views'
  set :public, File.dirname(__FILE__)+'/public'
  use Hancock::Client::Default do |sso|
    sso.sso_url = 'http://hancock.atmos.org/sso'
  end

  get '/' do
    haml(%Q{%h3= "#{session[:first_name]} #{session[:last_name]} - #{session[:email]}"})
  end
end

run HancockClientDemo
