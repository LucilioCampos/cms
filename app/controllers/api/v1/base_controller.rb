module Api::V1
  class BaseController < ApplicationController
    include Knock::Authenticable

      before_action :authenticate_user
      before_action :skip_session

      
      def current_user
        if token
          @_current_user ||= begin
            Knock::AuthToken.new(token: token).entity_for(User)
          rescue
            nil
          end
        else
          super
        end
      end

      private

      # JWT: No need to try and load session as there is none in an API request
      def skip_session
        request.session_options[:skip] = true if token
      end

      # JWT: overriding Knock's method to manually trigger Devise's auth.
      # When there is no token we assume the request comes from the browser so
      # has a session (potentially with warden key) attached.
      def authenticate_entity(entity_name)
        if token
          super(entity_name)
        else
          current_user
        end
      end

  end
end