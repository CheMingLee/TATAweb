class HomeController < ApplicationController

  def index
    @posts = Post.most_recent
    @products = Product.most_recent  
  end
end
