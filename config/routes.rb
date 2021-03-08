Rails.application.routes.draw do
  # homes
  root 'homes#top'
  get  'about', to: 'homes#about'

  # users
  devise_for :users
  resources :users, except: [:destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'followers', to: 'relationships#followers', as: 'followers'
    get 'followeds', to: 'relationships#followeds', as: 'followeds'
  end
  get   'users/unsubscribe/:id', to: 'users#unsubscribe'
  patch 'users/withdrew/:id',    to: 'users#withdrew'

# plots
  resources :plots do
    resources :comments, only: [:create, :update, :destroy]
    resources :likes,    only: [:create, :destroy]
  end

# tags
  # resources :tags do
  #   get 'plots', to: 'plots#search'
  # end

end
