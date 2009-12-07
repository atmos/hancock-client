require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe 'Hancock::Client::API' do
  before(:each) do
    Hancock::Client::API.auto_migrate!
  end

  describe ".signup" do
    describe "creates a user in the hancock server" do
      let(:user) do
        Hancock::Client::API.signup('atmos@atmos.org', 'Corey', 'Donohoe', 'foobarlol', true)
      end

      it "has no validation errors" do
        user.errors.should be_empty
      end
      it "has the email of the user signing up" do
        user.email.should eql('atmos@atmos.org')
      end
      it "has the fullname of the user signing up" do
        user.full_name.should eql('Corey Donohoe')
      end
    end

    describe "requires email addresses to be unique" do
      let(:user) do
        Hancock::Client::API.signup('atmos@atmos.org', 'Corey', 'Donohoe', 'foobarlol', true)
        Hancock::Client::API.signup('atmos@atmos.org', 'Corey', 'Donohoe', 'foobarlol', true)
      end

      it "has validation errors on email" do
        user.errors['email'].should eql(['Email is already taken'])
      end
      it "has the email of the user signing up" do
        user.email.should eql('atmos@atmos.org')
      end
      it "has the fullname of the user signing up" do
        user.full_name.should eql('Corey Donohoe')
      end
    end
  end
end
