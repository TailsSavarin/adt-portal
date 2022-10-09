# frozen_string_literal: true

RSpec.shared_context 'Пользователь не авторизован' do
  response 401, 'Не авторизован' do
    let(:Authorization) { '' }

    run_test!
  end
end
