# frozen_string_literal: true

require 'swagger_helper'

describe Api::PasswordsController, type: :request do
  path '/api/passwords' do
    let(:user) { create(:user, reset_password_token: '123456789') }

    post 'Отправка письма для восстановления пароля' do
      tags 'Восстановление пароля'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :reset_password, in: :body, schema: { '$ref': '#/components/schemas/reset_password_email' }

      response 200, 'письмо для восстановления пароля отправлено с поиском через почту' do
        let(:reset_password) do
          { email: user.email }
        end

        run_test! do
          user.reload
          expect(user.reset_password_token).to be_present
          expect(user.reset_password_sent_at).to be_present
        end
      end

      response 200, 'письмо для восстановления пароля отправлено с поиском через токен' do
        let(:reset_password) do
          { token: user.reset_password_token }
        end

        run_test! do
          user.reload
          expect(user.reset_password_token).not_to eq(reset_password[:token])
        end
      end

      response 404, 'пользователь не найден' do
        let(:reset_password) do
          { email: 'test' }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.passwords.errors.not_found'))
        end
      end
    end
  end

  path '/api/passwords/{token}' do
    get 'Проверка токена для восстановления пароля' do
      tags 'Восстановление пароля'
      consumes 'application/json'

      parameter(
        name: :token,
        type: :string,
        in: :path,
        required: true,
        description: 'Токен для восстановления пароля'
      )

      response 200, 'валидный токен' do
        let(:user) { create(:user, reset_password_token: '0123456789') }
        let(:token) { user.reset_password_token }

        run_test!
      end

      response 404, 'токен не найден' do
        let(:token) { '1' }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.passwords.errors.not_found'))
        end
      end

      response 422, 'просроченный токен' do
        let(:user) { create(:user, reset_password_token: '0123456789', reset_password_sent_at: 1.hour.ago) }
        let(:token) { user.reset_password_token }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.passwords.errors.expired'))
        end
      end
    end

    put 'Восстановление пароля' do
      let(:token) { user.reset_password_token }
      let(:password) { '123456' }
      let(:password_confirmation) { '123456' }

      tags 'Восстановление пароля'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :token, type: :string, in: :path, required: true
      parameter name: :password, in: :body, schema: { '$ref': '#/components/schemas/reset_password' }

      response '200', 'пароль обновлен' do
        let(:user) { create(:user, reset_password_token: '0123456789') }

        run_test!
      end

      response '422', 'просроченный токен' do
        let(:user) { create(:user, reset_password_token: '0123456789', reset_password_sent_at: 1.hour.ago) }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.passwords.errors.expired'))
        end
      end
    end
  end
end
