Rails.application.routes.draw do
  devise_for :authors

  root "home#index"
  get "/about", to: "home#about"

  resources :products

  resources :posts
end
