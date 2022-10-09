# frozen_string_literal: true

module Api
  class PasswordsController < BaseController
    def show
      user = ::User.find_by(reset_password_token: id)
      return render_error(I18n.t('api.passwords.errors.not_found'), status: :not_found) if user.blank?
      return render_error(I18n.t('api.passwords.errors.expired')) if user.reset_password_token_expired?

      head :ok
    end

    def create
      user = ::User.find_by(
        {
          email: params[:email]&.downcase,
          reset_password_token: params[:token]
        }.compact
      )
      return render_error(I18n.t('api.passwords.errors.not_found'), status: :not_found) if user.blank?

      user.generate_password_reset_token!
      UserMailer.with(user:).reset_password.deliver_later

      head :ok
    end

    def update
      user = ::User.find_by(reset_password_token: id)
      return render_error(I18n.t('api.passwords.errors.expired')) if user.blank? || user.reset_password_token_expired?

      updated = user.reset_password!(params[:password], params[:password_confirmation])
      head updated ? :ok : :unprocessable_entity
    end
  end
end
