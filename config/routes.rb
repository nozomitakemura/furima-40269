Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'items#index'
  resources :items, only: [:new, :index, :create, :show, :edit, :update] 
  # resources :items, only: [:new, :index, :create, :show, :edit, :update, :destroy] #削除機能実装用
  end



