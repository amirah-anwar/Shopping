Demo::Application.routes.draw do
  get "transactions/new"

  root :to => 'products#index'

  resources :orders, only: [:show] do
    member do
      get :checkout
    end
  end

  resources :transactions, only: [:new, :create]

  resources :ordered_products, only: [:destroy]

  devise_for :users

  resources :users do
    collection do
      get :dashboard
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
    resources :reviews
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
