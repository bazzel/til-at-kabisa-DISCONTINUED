# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :posts

      root to: "posts#index"
    end
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"
end
