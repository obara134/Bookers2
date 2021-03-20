Rails.application.routes.draw do
  
  
   devise_for :users
   root to: 'homes#top'
   resources :post_images, only: [:new, :create, :index, :show, :destroy] do
   
   end       
    resources :books
    resources :users, only: [:show, :edit, :update, :create]
end
 
 
