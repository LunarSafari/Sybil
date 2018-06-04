Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'worlds#index'

  resource :session

  resources :worlds do
    resources :concepts
    resources :plots
    resources :perspectives

    resources :characters do
      resources :perspectives
    end
  end
end
