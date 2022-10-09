# frozen_string_literal: true

module Api
  class SessionsController < BaseController
    before_action :authorize_refresh_request!, only: :update

    def create
      user = ::User.find_by(login: params[:login])
      return render_error(I18n.t('api.sessions.errors.wrong_params')) unless user&.authenticate(params[:password])

      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload:, refresh_payload: payload, refresh_by_access_allowed: true)
      render json: session.login
    end

    def update
      session = JWTSessions::Session.new(payload:)
      render json: session.refresh(found_token)
    end
  end
end
