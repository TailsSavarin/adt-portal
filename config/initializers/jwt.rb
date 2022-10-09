# frozen_string_literal: true

JWTSessions.token_store = :memory
if Rails.env.production?
  JWTSessions.token_store = [:redis, {
    redis_url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/5'),
    token_prefix: 'jwt_'
  }]
end

JWTSessions.encryption_key   = Rails.application.secret_key_base
JWTSessions.access_exp_time  = 1.day.to_i
JWTSessions.refresh_exp_time = 1.month.to_i
