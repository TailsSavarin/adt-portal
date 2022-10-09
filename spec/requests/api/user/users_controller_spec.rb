# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::User::UsersController, type: :request do
  let(:current_user) { create(:user) }

  path '/api/user/users' do
    get 'Список пользователей' do
      tags 'Пользователь'
      produces 'application/json'
      security [Bearer: {}]

      parameter(
        name: :id,
        in: :query,
        type: :integer,
        required: false,
        description: 'ID элемента'
      )

      parameter(
        name: :search,
        in: :query,
        type: :string,
        required: false,
        description: 'Поиск по полям: email login first_name last_name middle_name'
      )

      parameter(
        name: :sort_dir,
        in: :query,
        required: false,
        type: :string,
        default: nil,
        example: %i[asc desc],
        description: 'Направление сортировки'
      )

      parameter(
        name: :sort_col,
        in: :query,
        required: false,
        default: nil,
        type: :string,
        example: %w[id],
        description: 'Название поля для сортировки'
      )

      parameter(
        name: :page,
        in: :query,
        required: false,
        description: 'Номер нужной страници'
      )

      parameter(
        name: :items,
        in: :query,
        required: false,
        description: 'Кол-во элементов отображаемых на странице'
      )

      response '200', 'список пользователей получен' do
        let(:Authorization) { token_for(current_user)[:access] }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body.size).to eq(1)
        end
      end
    end
  end

  path '/api/user/users/{id}' do
    let(:another_user) { create(:user) }
    let(:id) { current_user.id }

    parameter name: :id,
              in: :path,
              type: :string,
              required: true,
              description: 'ID пользователя'

    get 'Получение пользователя' do
      tags 'Пользователь'
      produces 'application/json'
      security [Bearer: {}]

      response '200', 'пользователь получен' do
        let(:Authorization) { token_for(current_user)[:access] }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:id]).to eq(current_user.id)
        end
      end
    end

    put 'Редактирование пользователя' do
      tags 'Пользователь'
      consumes 'application/json'
      produces 'application/json'
      security [Bearer: {}]

      parameter name: :user, in: :body, schema: { '$ref': '#/components/schemas/user' }

      response '200', 'пользователь отредактирован' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:user) do
          {
            email: 'new_email@yandex.ru'
          }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:email]).to eq(user[:email])
        end
      end

      response '422', 'ошибка при редактирование пользователя' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:user) { { password: nil } }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:errors][:full_messages]).to be_present
        end
      end
    end
  end
end
