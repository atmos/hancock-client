require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "Hancock::Client::Default.exclude_paths=" do
  def app
    @app = Rack::Builder.new do
      use Hancock::Client::Middleware do |sso|
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
  it "excludes the specified path" do
    get '/api/tokenz'
    last_response.status.should eql(200)
  end
  it "excludes the specified path given query parameters" do
    get '/api/tokenz?foo=bar'
    last_response.status.should eql(200)
  end
  it "excludes the specified path at a nested level" do
    get '/api/tokenz/foo/bar/'
    last_response.status.should eql(401)
  end
end
