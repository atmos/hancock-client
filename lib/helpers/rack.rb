module Hancock
  module Helpers
    module Rack
      def sso_user_id
        session[:sso][:user_id]
      end

      def sso_user_email
        session[:sso][:email]
      end

      def sso_user_first_name
        session[:sso][:first_name]
      end

      def sso_user_last_name
        session[:sso][:last_name]
      end

      def sso_user_full_name
        "#{session[:sso][:first_name]} #{session[:sso][:last_name]}"
      end
    end
  end
end
