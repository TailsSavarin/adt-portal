# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s
  config.swagger_docs = YAML.safe_load(
    Rails.root.join('spec/swagger_docs.yml').read
  )&.with_indifferent_access

  config.swagger_format = :yaml
  config.swagger_dry_run = false

  # Автоматически генерировать примеры ответов
  config.after type: :request do |example|
    # for head: :no_content
    next if response.body.blank?

    current_description = example.metadata[:response][:description]
    example.metadata[:response][:content] ||= {}
    responses = example.metadata[:response][:content]

    response_json = JSON.parse(response.body, symbolize_names: true)
    next if response_json.blank?

    responses['application/json'] ||= { examples: {} }
    responses['application/json'][:examples][current_description] =
      { value: response_json, summary: current_description }
  end
end

def token_for(user)
  payload = { user_id: user.id }
  session = JWTSessions::Session.new(payload:, refresh_payload: payload, refresh_by_access_allowed: true)
  session.login
end
