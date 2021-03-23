Rails.application.routes.draw do
  get 'search/search'
  get 'uploads/create'
  get 'uploads/destroy'
  # homes
  root 'homes#top'
  get  'about', to: 'homes#about'

  # users
  devise_for :users
  resources :users, except: [:destroy] do
    member do
      get :followed, :followers
    end
    resources :relationships, only: [:create, :destroy]
    # get 'followers', to: 'relationships#followers', as: 'followers'
    # get 'followeds', to: 'relationships#followeds', as: 'followeds'
  end
  put "/users/:id/hide", to: "users#hide", as: "users_hide"
  patch 'users/withdrew/:id',    to: 'users#withdrew'

  # plots
  resources :plots do
    resources :comments, only: [:create, :update, :destroy]
    # likesはresorceで規定する
    resource :likes,    only: [:create, :destroy]
  end
  resources :uploads, only: [:create, :destroy]

  # tags
  resources :tags do
    get 'plots', to: 'plots#search'
  end

  # searchs
  get '/search', to: 'search#search'
end
