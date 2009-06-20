require File.dirname(__FILE__) + '/spec_helper'

describe ::Hancock::Client::Default do
  it "should protect the root url" do
    get '/'
    last_response.headers['Location'].should eql('/sso/login')
    get last_response.headers['Location']
    last_response.headers['Location'].should eql('http://localhost:20000/login?return_to=http://example.org/sso/login')
  end

  %w(get post put head delete).each do |verb|
    it "should protect the root url from HTTP #{verb}" do
      send(verb, '/')
      last_response.headers['Location'].should eql('/sso/login')
      get last_response.headers['Location']
      last_response.headers['Location'].should eql('http://localhost:20000/login?return_to=http://example.org/sso/login')
    end
  end
  it "should greet the user when authenticated" do
    pending
    get '/'
    last_response.should have_selector('p')
  end
end
