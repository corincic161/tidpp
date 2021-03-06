Rails.application.routes.draw do
  get 'sessions/new'

  # resources :static_pages
  root 'static_pages#home'

  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :microposts, only: [:create, :destroy] do
    resource :likes, module: :microposts, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
