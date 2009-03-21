require 'sinatra/base'

module Hancock
  module Spec
    class Client < ::Hancock::Client::Default
      set :environment, :development
      get '/' do
        redirect '/sso/login' unless session[:user_id]
        haml(<<-HAML
%table
  %thead
    %tr
      %td Key
      %td Value
  %tbody
    - session.keys.sort { |a,b| a.to_s <=> b.to_s }.each do |key|
      %tr
        %td= key
        %td= session[key]
HAML
)
      end
    end
  end
end
