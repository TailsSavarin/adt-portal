# frozen_string_literal: true

module Api
  module User
    class BaseController < Api::BaseController
      before_action :authorize_access_request!

      rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorized

      private

      def not_authorized
        render_error(I18n.t('api.base.errors.not_authorized'), status: :unauthorized)
      end

      def current_user
        @current_user ||= ::User.find(payload['user_id'])
      end
    end
  end
end
