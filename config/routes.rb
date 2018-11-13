Rails.application.routes.draw do
  get 'searches/search'
  get 'admin_pages/index'
  get 'admin_pages/show'
  devise_for :users
  resources :products
  resources :products_comments, only: [:create, :edit, :destroy]
  resources :carts, only: [:show, :index]
  resources :carts_products, only: [:create, :update, :destroy]
  resources :talks, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :destroy, :update]
  resources :buys, only: [:index]
  resources :buys_products, only: [:create, :destroy]
  resources :admin_pages, only: [:index, :show]


  get "/home/about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlß
  root to: 'products#index'
end
