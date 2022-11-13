# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api, format: :json do
    namespace :user do
      resources :users
      resource :session, only: %i[show destroy]
    end

    resource :session, only: %i[create update]
    resources :passwords, only: %i[show create update]
  end

  root 'home#index'
  get '*path', to: 'home#index', constraints: ->(req) { req.path.exclude?('rails/active_storage') }
end
