Bundler.require_env(:test)
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'hancock-client', 'mock_middleware')

World do
  def sso_server
    @sso_server ||= 'http://hancock.atmos.org'
  end
  def browser
    @browser ||= Watir::Safari.new
  end

  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
end
