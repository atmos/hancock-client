require File.dirname(__FILE__) + '/spec_helper'

class MyMockApp
  def self.call(env)
    request = Rack::Request.new(env)
    [200, {'Content-Type' => 'text/html', 'Content-Length' => '5'}, ["HELLO #{request.session[:sso][:email]}"] ]
  end
end

describe "Hancock::Client::MockMiddleware" do
  def app
    @app = Rack::Builder.new do
      use Hancock::Client::MockMiddleware do |sso|
        sso.sso_url = 'http://localhost:20000'
      end
      map '/' do
        run MyMockApp
      end
    end
  end
  it "should have a valid users logged in" do
    get '/'
    last_response.body.should match(/^HELLO \w{3,12}@example.com$/)
    last_response.status.should eql(200)
  end
end
