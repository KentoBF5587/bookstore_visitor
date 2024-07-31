Rails.application.routes.draw do
  root 'static_pages#top'

  resources :users, only: %i[new create]
  resources :bookstores, only: %i[index show new edit create update destroy] do
    resources :store_reviews, only: %i[show new  edit create update destroy], shallow: true
    collection do
      get :wanna_go_bookstores
    end
  end

  resource :profiles, only: %i[show edit update] do
    get "bookstore_list", to: "profiles#bookstore_list"
    get "review_list", to: "profiles#review_list"
    resources :purchase_histories, only: %i[create edit update destroy]
  end
  resources :wanna_go_bookstores, only: %i[create destroy]
  resources :password_resets, only: %i[new edit create update]
  resources :questions, only: %i[index create] do
    collection do
      get :result
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'how_to_use', to: 'pages#how_to_use'
  get 'inquiry', to: 'pages#inquiry'
  get 'select_login', to: 'pages#select_login'
  get 'terms_of_service', to: 'pages#terms_of_service'
  get 'privacy_policy', to: 'pages#privacy_policy'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/provider', to: 'oauths#oauth', as: :auth_at_provider
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
