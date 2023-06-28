Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  
  
  root to: "homes#top"
  get 'protective_cats/new'
  get 'protective_cats/index'
  get 'protective_cats/show'
  get 'protective_cats/edit'
  get 'stray_cats/new'
  get 'stray_cats/index'
  get 'stray_cats/show'
  get 'stray_cats/edit'
  get 'admin/top'
  get 'admin/edit'
  get 'homes/top'
  get 'homes/about'
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  
   get 'homes/about' => 'homes#about', as: 'about'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
