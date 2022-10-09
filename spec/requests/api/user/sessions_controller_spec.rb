# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::User::SessionsController, type: :request do
  let(:user) { create(:user) }

  path '/api/user/session' do
    get 'Получение текущего пользователя' do
      tags 'Пользователь - Сессия'
      produces 'application/json'
      security [Bearer: {}]

      response 200, 'пользователя успешно получен' do
        let(:Authorization) { token_for(user)[:access] }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)

          expect(body).to be_present
          expect(body[:id]).to eq(user.id)
        end
      end
    end

    delete 'Удаление сессии' do
      tags 'Пользователь - Сессия'
      produces 'application/json'
      security [Bearer: {}]

      response 200, 'сессия удалена' do
        let(:Authorization) { token_for(user)[:access] }

        run_test!
      end
    end
  end
end
