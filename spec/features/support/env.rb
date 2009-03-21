require File.expand_path(File.dirname(__FILE__)+'/../../spec_helper')
gem 'safariwatir', '~>0.3.3'
require 'safariwatir'

World do
  def sso_server
    @sso_server ||= 'http://hancock.atmos.org/sso'
  end
  def browser
    @browser ||= Watir::Safari.new
  end

  def app
    @app = Rack::Builder.new do
      run Hancock::Spec::Client
    end
  end
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
end
