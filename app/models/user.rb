# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  RESET_PASSWORD_EXP_TIME = 15

  has_one_attached :avatar

  validates :login, uniqueness: true, presence: true

  def generate_password_reset_token!
    update(
      reset_password_token: SecureRandom.hex(10),
      reset_password_sent_at: Time.zone.now
    )
  end

  def reset_password_token_expired?
    return false unless reset_password_sent_at

    expiration_date = reset_password_sent_at + RESET_PASSWORD_EXP_TIME.minutes
    Time.zone.now > expiration_date
  end

  def reset_password!(password, password_confirmation)
    update(
      password:,
      password_confirmation:,
      reset_password_token: nil,
      reset_password_sent_at: nil
    )
  end
end
