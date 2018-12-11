Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/tata_admin', as: 'rails_admin'
  devise_for :authors

  root "home#index"
  get "/about", to: "home#about"

  resources :products

  resources :posts
end
