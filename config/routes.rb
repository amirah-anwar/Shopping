Demo::Application.routes.draw do
  root :to => 'products#index'
  resources :reviews
  resources :orders
  devise_for :users

  resources :users do
    collection do
      get :dashboard
    end
  end

  resources :products do
    resources :reviews
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
