# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  namespace :admin do
      resources :posts
      resources :authors
      resources :channels

      root to: "posts#index"
    end

  resources :posts, only: [:index, :show] do
    get ":id", on: :collection, to: "posts#show", as: "random", constraints: { id: "random" }
  end

  get "channels/:channel_id", to: "posts#index", as: "channel"
  # resources :channels, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
