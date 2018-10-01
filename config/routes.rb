Rails.application.routes.draw do
  devise_for :authors
  root "blog/posts#index"

  namespace :authors do
    resources :posts
  end

  scope module: "blog" do
    get "market", to: "home#market", as: :market
    get "posts", to: "posts#index", as: :posts
    get "posts/:id", to: "posts#show", as: :post
  end
end
