Rails.application.routes.draw do
  devise_for :authors
  
  root "posts#index"

  resources :products

  resources :posts
end
