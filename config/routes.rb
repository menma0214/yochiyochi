Rails.application.routes.draw do
  get 'facilities/index'
  get 'facilities/show'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  # get '/logout', to: 'user_sessions#destroy'
  delete 'logout', to: 'user_sessions#destroy'
  root 'tops#index'

  get 'tops/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :tops, only: %i[index]
  resources :users, only: %i[new create]
  resources :facilities, only: %i[index show] do
    collection do
      get 'search', to: 'facilities#index', as: :search
    end
  end
end
