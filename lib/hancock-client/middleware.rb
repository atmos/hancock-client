module Hancock
  module Client
    class Middleware < DefaultMiddleware
      register ::Hancock::Client::SSO
    end
  end
end
