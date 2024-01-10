Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  get "rentals-request/new", to: "rentals#new"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/profile", to: "users#show"
  resources :restaurants, only: %i[destroy]
  resources :restaurants, only: %i[index show edit update new create] do
    resources :rentals, only: %i[new create]
  end

  resources :rentals do
    member do
      patch :accept
    end
  end

  resources :rentals do
    member do
      patch :decline
    end
  end
end
