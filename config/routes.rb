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
  end
  resources :wanna_go_bookstores, only: %i[create destroy]

  get 'how_to_use', to: 'pages#how_to_use'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
