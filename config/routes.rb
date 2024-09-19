Rails.application.routes.draw do
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  # get "oauth/callback", to: "user_sessions#create"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  # 退会確認ページ
  get 'users/withdraw', to: 'users#withdraw'
  # 退会処理
  delete 'users/withdraw', to: 'users#destroy'

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
  root 'static_pages#index'

  get 'static_pages/index'
  get 'static_pages/terms_of_use', to: 'static_pages#terms_of_use'
  get 'static_pages/privacy_policy', to: 'static_pages#privacy_policy'
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
  resources :users, only: %i[new create show destroy withdraw]
    # collection do
    #   get 'static_pages/terms_of_use'
    # end
    resources :reviews, only: %i[user_reviews]
  resource :diagnostics, only: %i[new create]do
    get :complete, on: :collection
    collection do
      get 'static_pages/terms_of_use'
    end
  end
  resources :user_sessions, only: %i[new create destroy]
    # collection do
    #   get 'static_pages/terms_of_use'
    # end
  resources :mypages, only: %i[index show edit update]
    # collection do
    #   get 'static_pages/terms_of_use'
    # end
  resources :bookmarks, only: %i[index create destroy]
    # collection do
    #   get 'static_pages/terms_of_use'
    # end
  resources :events do
    get 'static_pages/terms_of_use', on: :member #idの取得が必要な場合
    resources :reviews, only: %i[index show new create update destroy edit update]  # 必要なアクションのみを指定する
      get 'static_pages/terms_of_use', on: :member
    collection do
      get :bookmarks, only: %i[index create destroy]
      get :autocomplete
      get 'static_pages/terms_of_use'
    end
  end
  resources :facilities, only: %i[index show new create update destroy] do

    collection do
      get :bookmarks, only: %i[index create destroy]
      get :autocomplete
      get 'static_pages/terms_of_use'
    end
    resources :playground_equipments, only: %i[index show],shallow: true
      collection do
        get 'static_pages/terms_of_use'
      end
    resources :reviews, only: %i[index new show create destroy edit update]  # 必要なアクションのみを指定する
      collection do
        get 'static_pages/terms_of_use'
      end
  end
  resources :autocomplete, only: %i[index]
  resources :password_resets, only: %i[new create edit update]
  resources :recommendations, only: %i[index]
    # collection do
    #   get 'static_pages/terms_of_use'
    # end
end
