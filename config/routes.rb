Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :product_comments, only: [:create, :edit, :destroy]
  resources :carts, only: [:show, :index]
  resources :carts_products, only: [:create, :update, :destroy]
  resources :talks, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :destroy, :update]
  resources :buys, only: [:index]
  resources :buys_products, only: [:create, :destroy]
  resources :mails, only: [:create, :new]
  resources :admins, only: [:index, :show]
  get "/searches" => "searches#search"
  get "/home/about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'products#index'
end
