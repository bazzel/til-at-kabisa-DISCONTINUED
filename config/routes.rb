# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  namespace :admin do
      resources :posts
      resources :channels

      root to: "posts#index"
    end

  resources :posts, only: [:index, :show] do
    get "random", on: :collection, to: "posts#show"
  end

  get "channels/:channel_id", to: "posts#index", as: "channel"
  get "login/create", to: "logins#create", as: :create_login

  root to: "posts#index"
end
