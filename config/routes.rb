Rails.application.routes.draw do
  
   devise_for :admin, skip: [:registrations, :passwords], controllers: {
   sessions: "admin/sessions",
  }


  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions",
  }
  
  
   namespace :user do
    root to: "homes#top"
    get "homes/about"
    get 'index'
    get "information/edit" => "user#edit", as: "user_edit"
    get "mypage" => "user#show", as: "user_mypage"
    patch "update" => "user#update"
    get "user/confirm" => "user#confirm", as: "user_confirm"
    patch "user/cancel" => "user#cancel", as: "user_cancel"
   end
     #resources :users, only: [:index, :show, :edit, :update]
    resources :stray_cats, only: [:new, :index, :update, :destroy, :create, :edit] do
    resources :protective_cats, only: [:new, :index, :update, :destroy, :create, :edit]
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
   end


  namespace :admin do
    get 'post_images/index'

    get "top" => "homes#top", as: "top"
    get "show" => "homes#show", as: "show"

   resources :stray_cats, only: [:new, :index, :update, :destroy, :create, :edit] do
    resources :protective_cats, only: [:new, :index, :update, :destroy, :create, :edit]
    resources :users, expect: [:new, :destroy, :create]
  end
 
   

 
  

   
  
  
  
  
  
   
 

  
