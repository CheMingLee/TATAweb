Rails.application.routes.draw do
  devise_for :authors
  root "blog/posts#index"

  resources :products

  namespace :authors do
    resources :posts
  end

  scope module: "blog" do
    get "posts", to: "posts#index", as: :posts
    get "posts/:id", to: "posts#show", as: :post
  end
end
