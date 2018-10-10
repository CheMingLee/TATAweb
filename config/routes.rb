Rails.application.routes.draw do
  devise_for :authors
  root "posts#index"

  resources :products

  resources :posts

  # namespace :authors do
  #   resources :posts
  # end

  # scope module: "authors" do
  #   get "posts", to: "posts#index", as: :posts
  #   get "posts/:id", to: "posts#show", as: :post
  # end
end
