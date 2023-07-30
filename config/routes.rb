Rails.application.routes.draw do

  get 'rooms/show'
  devise_for :admins, path: 'admin', skip: [:registrations, :passwords], controllers: {
    sessions: "admin/admins/sessions",
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  root to: "homes#top"
  get "homes/about"
  
  resources :rooms do
    resources :messages
  end
  
  post 'create_myroom', to: 'rooms#create_myroom'
  
  resources :users, only: [:show, :edit, :update]
  
  resources :stray_cats do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :protective_cats do
    resource :p_favorites, only: [:create, :destroy]
    resources :p_post_comments, only: [:create, :destroy]
  end

  namespace :admin do
    get "/" => 'homes#index'
    get 'comments/index'
    resources :users, only: [:index, :show, :destroy]
   resources :comments, only: [:index, :destroy]
  end
end

