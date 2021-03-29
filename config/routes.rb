Rails.application.routes.draw do
  get 'search/search'
  get 'uploads/create'
  get 'uploads/destroy'

  # homes
  root 'homes#top'
  get  'about', to: 'homes#about'
  get 'convention', to: 'homes#convention'

  # users
  devise_for :users
  resources  :users, except: [:destroy] do
    member do
      get :followed, :followers
    end
    resources :relationships, only: %i[create destroy]
  end
  # user論理削除
  put '/users/:id/hide', to: 'users#hide', as: 'users_hide'

  # plots
  resources :plots do
    resources :comments, only: %i[create update destroy]
    resource  :likes,    only: %i[create destroy]
  end
  resources :uploads, only: %i[create destroy]

  # tags
  resources :tags, only: %i[index show search]

  # searchs
  get '/search', to: 'search#search'

  # 404 not foundなどをいれたい
end
