Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root to: 'items#index'
  # resources :items, only: [:new, :index, :create, :show, :edit, :update, :destroy]  #購入機能実装前の記述

devise_for :users  #合っているかわからない
  root to: "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
