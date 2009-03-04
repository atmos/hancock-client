module Hancock
  module Spec
    class Client < Sinatra::Default
      register Sinatra::Hancock::SSO
      enable :sessions
      set :environment, :test

      get '/' do
        redirect '/login' unless session[:user_id]
        haml(<<-HAML
%table
  %thead
    %tr
      %th Key
      %th Value
  - session.keys.each do |key|
    %tbody
      %tr
        %td= key
        %td= session[key]
HAML
)
      end
    end
  end
end
