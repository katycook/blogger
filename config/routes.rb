Rails.application.routes.draw do

  resources :pages

  root to: 'articles#index'
  resources :articles do
    resources :comments
  end

  resources :tags

  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]

  resources :month_years

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

  get 'dashboard' => 'dashboard#index'

  get '/:id' => 'pages#show'
  
end
