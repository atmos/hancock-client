require File.dirname(__FILE__) + '/spec_helper'

describe ::Hancock::Client::Default do
  def app
    @app = Rack::Builder.new do
      use Hancock::Client::Default do |sso|
        sso.sso_url = 'http://localhost:20000'
        sso.exclude_paths = %w(/foo/bar /api/tokenz)
      end
      map '/' do
        run Proc.new {|env| [200, {'Content-Type' => 'text/html', 'Content-Length' => '5'}, ['HELLO']] }
      end
      map '/api/tokenz' do
        run Proc.new {|env| [200, {'Content-Type' => 'text/html', 'Content-Length' => '5'}, ['HELLO']] }
      end
    end
  end
  it "should exclude the specified path" do
    get '/api/tokenz'
    last_response.status.should eql(200)
  end
  it "should exclude the specified path given query parameters" do
    get '/api/tokenz?foo=bar'
    last_response.status.should eql(200)
  end
end
