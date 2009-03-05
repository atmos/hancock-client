require File.dirname(__FILE__) + '/spec_helper'

describe Sinatra::Hancock::SSO do
  it "should protect the root url" do
    get '/'
    @response.headers['Location'].should eql('/sso/login')
  end
  it "should greet the user when authenticated" do
    get '/', { }, :session => {:user_id => 42}
    @response.body.should have_selector('p')
  end
end
