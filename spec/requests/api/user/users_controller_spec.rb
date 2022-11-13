# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe Api::User::UsersController, type: :request do
  let(:current_user) { create(:user) }

  path '/api/user/users' do
    get 'Получить список пользователей' do
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
        example: %i[id],
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

      response 200, 'Список пользователей получен' do
        let(:Authorization) { token_for(current_user)[:access] }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body.size).to eq(1)
        end
      end
    end

    post 'Создать пользователя' do
      tags 'Пользователь'
      consumes 'multipart/form-data'
      produces 'application/json'
      security [Bearer: {}]

      parameter name: :user, in: :formData, schema: { '$ref': '#/components/schemas/user' }

      response 201, 'Пользователь создан' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:user) do
          {
            login: 'test',
            password: 'test'
          }
        end

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:login]).to eq(user[:login])
        end
      end

      response 422, 'Ошибка при создании пользователя' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:user) { { login: nil } }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:errors][:full_messages]).to be_present
        end
      end

      include_examples 'Пользователь не авторизован' do
        let(:user) { {} }
      end
    end
  end

  path '/api/user/users/{id}' do
    let(:another_user) { create(:user) }
    let(:id) { another_user.id }

    parameter name: :id,
              in: :path,
              type: :string,
              required: true,
              description: 'ID пользователя'

    get 'Получить пользователя' do
      tags 'Пользователь'
      produces 'application/json'
      security [Bearer: {}]

      response 200, 'Пользователь получен' do
        let(:Authorization) { token_for(current_user)[:access] }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:id]).to eq(another_user.id)
        end
      end

      response 404, 'Пользователь не найден' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:id) { 0 }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.users.errors.not_found'))
        end
      end

      include_examples 'Пользователь не авторизован'
    end

    put 'Отредактировать пользователя' do
      tags 'Пользователь'
      consumes 'multipart/form-data'
      produces 'application/json'
      security [Bearer: {}]

      parameter name: :user, in: :formData, schema: { '$ref': '#/components/schemas/user' }

      response 200, 'Пользователь отредактирован' do
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

      response 404, 'Пользователь не найден' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:user) { {} }
        let(:id) { 0 }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.users.errors.not_found'))
        end
      end

      response 422, 'Ошибка при редактирование пользователя' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:user) { { login: nil } }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:errors][:full_messages]).to be_present
        end
      end

      include_examples 'Пользователь не авторизован' do
        let(:user) { {} }
      end
    end

    delete 'Удалить пользователя' do
      tags 'Пользователь - Пользователи'
      produces 'application/json'
      security [Bearer: {}]

      response 204, 'Пользователь удален' do
        let(:Authorization) { token_for(current_user)[:access] }

        run_test! do
          expect { another_user.reload }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end

      response 404, 'Пользователь не найден' do
        let(:Authorization) { token_for(current_user)[:access] }
        let(:id) { 0 }

        run_test! do
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.users.errors.not_found'))
        end
      end

      response 422, 'Ошибка при удаление пользовалтеля' do
        let(:Authorization) { token_for(current_user)[:access] }

        before { allow_any_instance_of(User).to receive(:destroy).and_return(false) }

        run_test! do |response|
          body = JSON.parse(response.body, symbolize_names: true)
          expect(body[:error]).to eq(I18n.t('api.users.errors.destroy'))
        end
      end

      include_examples 'Пользователь не авторизован'
    end
  end
end
