require File.dirname(__FILE__) + '/spec_helper'

describe Sinatra::Hancock::SSO do

  it "should protect the root url" do
    get '/'
    last_response.headers['Location'].should eql('/sso/login')
    get last_response.headers['Location']
    last_response.headers['Location'].should eql('http://localhost:20000/login?return_to=http://example.org/sso/login')
  end

  it "should greet the user when authenticated" do
    pending
    get '/'
    last_response.should have_selector('p')
  end
end
