require 'rack/client'

require File.join(Hancock::Client.libdir, 'hancock-api', 'http')

module Hancock
  module Client
    module API
      class User < Struct.new(:email, :password, :first_name, :last_name, :admin, :errors)
        def full_name
          "#{first_name} #{last_name}"
        end

        def self.from_json(json)
          data   = JSON.parse(json)
          user   = data['user']

          new(user['email'],
              user['password'],
              user['first_name'],
              user['last_name'],
              user['admin'] == 'true',
              data['errors'])
        end
      end

      def self.endpoint
        @endpoint ||= 'http://localhost:9292'
      end

      def self.path_for(path)
        "#{endpoint}#{path}"
      end

      def self.signup(email, first_name, last_name, password, admin = false)
        post_params = {
          :email                 => email,
          :first_name            => first_name,
          :last_name             => last_name,
          :password              => password,
          :password_confirmation => password,
          :admin                 => admin.to_s
        }
        response = Rack::Client.post(path_for("/users"), post_params, {'HTTP_ACCEPT' => 'application/json'})
        User.from_json(response.body)
      end

      def self.auto_migrate!
        Rack::Client.get('http://localhost:9292/users/cleanup', { }, {'HTTP_ACCEPT' => 'application/json'})
      end
    end
  end
end
