module Hancock
  module Client
    class MockMiddleware < DefaultMiddleware
      helpers Hancock::Client::Helpers::Rack

      before do
        unless sso_logged_in?
          sso_login_as((0..42).pick, {
            :email => "#{/\w{3,8}/.gen.downcase}@example.com",
            :first_name => Randgen.first_name,
            :last_name => Randgen.first_name
          })
        end
      end

      register Hancock::Client::SSO

    end
  end
end
