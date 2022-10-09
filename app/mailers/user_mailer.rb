# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def reset_password
    @user = params[:user]
    @token = @user.reset_password_token
    attachments['logo.svg'] = Rails.root.join('app/assets/images/logo.svg').read
    mail(to: @user.email, subject: t('mailers.user_mailer.reset_password.subject'))
  end
end
