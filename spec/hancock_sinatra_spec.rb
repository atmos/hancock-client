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
      last_response.headers['Location'].should eql('/sso/login')
      get last_response.headers['Location']
      last_response.headers['Location'].should eql('http://localhost:20000/login?return_to=http://example.org/sso/login')
    end
  end
end
