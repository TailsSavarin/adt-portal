# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  it 'returns status ok' do
    get :index
    expect(response).to have_http_status(:ok)
  end
end
