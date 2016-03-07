Demo::Application.routes.draw do
resources :reviews
  devise_for :users
  resources :users do
    resources :products do
      resources :reviews
    end
  end
  resources :products do
    resources :reviews
  end
  root :to => 'products#index'

  get '/dashboard' => 'users#dashboard'
end
