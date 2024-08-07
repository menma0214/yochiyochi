Rails.application.routes.draw do
  get 'diagnostics/new'
  get 'diagnostics/create'
  namespace :admin do
    resources :sessions, only: %i[new create destroy]
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'events/index'
  get 'events/show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  # get '/logout', to: 'user_sessions#destroy'
  delete 'logout', to: 'user_sessions#destroy'
  root 'tops#index'

  get 'tops/index'
  get 'users/:id/reviews', to: 'reviews#user_reviews', as: 'user_reviews'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # namespace :admin do
  #   get 'dashboard/index'
  #   root "dashboards#index"
  #   resource :dashboard, only: %i[index]
  #   get 'login' => 'user_sessions#new', :as => :login
  #   post 'login' => "user_sessions#create"
  #   delete 'logout' => 'user_sessions#destroy', :as => :logout
  # end

  resources :tops, only: %i[index]
    resources :bookmarks, only: %i[index create destroy]
  resources :users, only: %i[new create show edit update]
    resources :reviews, only: %i[user_reviews]
  resource :diagnostics, only: %i[new create]do
    get :complete, on: :collection
  end
  resources :user_sessions, only: %i[new create destroy]
  resources :mypages, only: %i[index show edit update]
  resources :bookmarks, only: %i[index create destroy]
  resources :events do
    resources :reviews, only: %i[index show new create update destroy edit update]  # 必要なアクションのみを指定する
    collection do
      get :bookmarks, only: %i[index create destroy]
    end
  end
  resources :facilities, only: %i[index show new create update destroy] do
    collection do
      get :bookmarks, only: %i[index create destroy]
    end
    resources :playground_equipments, only: %i[index show],shallow: true
    resources :reviews, only: %i[index new show create destroy edit update]  # 必要なアクションのみを指定する
  end
  resources :bookmarks, only: %i[create destroy]
  resources :password_resets, only: %i[new create edit update]

end
