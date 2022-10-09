# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    include Pagy::Backend
    include JWTSessions::RailsAuthorization

    rescue_from JWTSessions::Errors::Expired, with: :refresh_expired

    skip_before_action :verify_authenticity_token
    after_action :set_pagination_headers

    private

    def set_pagination_headers
      pagy_headers_merge(@pagy) if @pagy
    end

    def render_error(error, status: :unprocessable_entity)
      render json: { error: }, status:
    end

    def id
      params[:id]
    end

    def refresh_expired
      render_error(I18n.t('api.base.errors.refresh_expired'), status: :forbidden)
    end
  end
end
