require 'sinatra/base'

module Hancock
  module Spec
    class Client < ::Hancock::Client::Default
      get '/' do
        redirect '/sso/login' unless session[:user_id]
        haml(<<-HAML
%p
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
HAML
)
      end
    end
  end
end
