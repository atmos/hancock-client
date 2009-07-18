module Hancock
  module Client
    def self.sso_url=(url)
      @sso_url = url
    end
    def self.sso_url
      @sso_url
    end

    class DefaultMiddleware < ::Sinatra::Base
      enable :sessions
      enable :raise_errors
      disable :show_exceptions

      set :sso_url, nil
      set :exclude_paths, nil

      def sso_url=(url)
        options.sso_url = url
        Hancock::Client.sso_url = url
      end

      def exclude_paths=(paths)
        options.exclude_paths = paths
      end
    end
  end
end
