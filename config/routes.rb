Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :products
  resources :product_comments, only: [:create, :edit, :destroy]
  resources :carts, only: [:show, :index, :create]
  resources :cart_products, only: [:create, :update, :destroy]
  resources :talks, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :destroy, :update]
  resources :buys, only: [:show]
  resources :buy_products, only: [:update, :destroy]
  resources :mails, only: [:create, :new]

  resources :admins, only: [:index, :show]
  get 'search' => 'searches#search', as: "search"
  get "/homes/about" => "homes#about"
  root to: 'products#index'
end
