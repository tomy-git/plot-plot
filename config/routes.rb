Rails.application.routes.draw do
  get 'search/search'
  get 'uploads/create'
  get 'uploads/destroy'

  # homes
  root 'homes#top'
  get  'about', to: 'homes#about'

  # users
  devise_for :users
  resources  :users, except: [:destroy] do
    member do
      get :followed, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end
  # user論理削除
  put "/users/:id/hide", to: "users#hide", as: "users_hide"

  # plots
  resources :plots do
    resources :comments, only: [:create, :update, :destroy]
    resource  :likes,    only: [:create, :destroy]
  end
  resources :uploads, only: [:create, :destroy]

  # tags
  resources :tags, only: [:index, :show, :search]

  # searchs
  get '/search', to: 'search#search'

  # 404 not foundなどをいれたい
end
