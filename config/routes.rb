Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :characters do
    resources :perspectives
  end

  resources :perspectives

  resources :concepts

  resource :session

  resources :plots
end
