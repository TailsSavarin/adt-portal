# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::SessionsController, type: :request do
  let(:user) { create(:user) }

  path '/api/session' do
    post 'Создать сессию' do
      tags 'Сессия'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :auth, in: :body, schema: { '$ref': '#/components/schemas/auth' }

      response 200, 'Сессия создана' do
        let(:auth) do
          {
            login: user.login,
            password: user.password
          }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)

          %i[csrf access access_expires_at refresh refresh_expires_at].each do |k|
            expect(body).to have_key(k)
          end
        end
      end

      response 422, 'Неверный пароль' do
        let(:auth) do
          {
            login: user.login,
            password: 'wrong password'
          }
        end
        run_test!
      end
    end

    put 'Обновить токен' do
      tags 'Сессия'
      produces 'application/json'
      consumes 'application/json'

      parameter(
        in: :header,
        type: :string,
        name: 'X-Refresh-Token',
        required: true,
        description: 'Рефрешь токен'
      )

      response 200, 'Токен сессии обновлен' do
        let(:'X-Refresh-Token') { token_for(user)[:refresh] } # rubocop:disable RSpec/VariableName

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)

          expect(body).to have_key(:csrf)
          expect(body).to have_key(:access)
          expect(body).to have_key(:access_expires_at)
        end
      end

      response 403, 'Срок действия рефреш токена истек' do
        let!(:'X-Refresh-Token') { token_for(user)[:refresh] } # rubocop:disable RSpec/VariableName, RSpec/LetSetup

        before { travel_to 2.months.after }

        after { travel_back } # rubocop:disable Rails/RedundantTravelBack

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.base.errors.refresh_expired'))
        end
      end
    end
  end
end
