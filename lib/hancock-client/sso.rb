module Hancock
  module Client
    module SSO
      def self.registered(app)
        app.use(Rack::OpenID, OpenID::Store::Filesystem.new("#{Dir.tmpdir}/openid"))
        app.use(Rack::OpenID, OpenID::Store::Filesystem.new("#{Dir.tmpdir}/openid"))
        app.helpers Hancock::Client::Helpers::Rack

        app.helpers do
          def build_openid_headers
            response['WWW-Authenticate'] = Rack::OpenID.build_header(
              :trust_root => absolute_url('/sso/login'),
              :return_to  => absolute_url('/sso/login'),
              :anonymous => true
            )
            throw :halt, [401, 'got openid?']
          end

          def handle_openid_response(response)
            if response.status == :success
              if contact_id = response.display_identifier.split("/").last
                sreg_params = response.message.get_args("http://openid.net/extensions/sreg/1.1")
                sso_login_as(contact_id, sreg_params)
                redirect session[:hancock_sso_return_to] || '/'
              else
                raise "No contact could be found for #{response.display_identifier}"
              end
            else
              throw :halt, [503, "Error: #{response.status}"]
            end
          end
        end

        app.before do 
          next if request.path_info == '/sso/login'
          next if request.path_info == '/sso/logout'
          next if excluded_path?
          next if sso_logged_in?
          if request.get?
            session[:hancock_sso_return_to] = request.fullpath[request.script_name.size..-1]
          end
          build_openid_headers
        end

        app.get '/sso/login' do
          if openid = request.env["rack.openid.response"]
            handle_openid_response(openid)
          end
          build_openid_headers
        end

        app.get '/sso/logout' do
          session.clear
          redirect "#{options.sso_url}/sso/logout"
        end
      end
    end
  end
end
