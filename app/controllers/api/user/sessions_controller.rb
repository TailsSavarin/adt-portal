# frozen_string_literal: true

module Api
  module User
    class SessionsController < BaseController
      def show
        user = ::User.find(payload['user_id'])
        render json: UserSerializer.render(user)
      end

      def destroy
        session = JWTSessions::Session.new(payload:)
        session.flush_by_access_payload
        head :ok
      end
    end
  end
end
