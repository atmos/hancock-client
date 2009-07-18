require File.dirname(__FILE__) + '/spec_helper'

describe 'Hancock::Client::Default' do
  def app
    @app = Rack::Builder.new do
      use Hancock::Client::Middleware do |sso|
        sso.sso_url = 'http://localhost:20000'
      end
      map '/' do
        run Proc.new {|env| [200, {'Content-Type' => 'text/html', 'Content-Length' => '5'}, ['HELLO']] }
      end
    end
  end

  it "should protect the root url from all HTTP verbs" do
    %w(get post put head delete).each do |verb|
      send(verb, '/')
      last_response['WWW-Authenticate'].should be
      last_response.status.should eql(401)

      last_response['WWW-Authenticate'].should match(%r!anonymous="true"!)
      last_response['WWW-Authenticate'].should match(%r!trust_root="http://example.org/sso/login"!)
      last_response['WWW-Authenticate'].should match(%r!return_to="http://example.org/sso/login"!)
    end
  end
end
