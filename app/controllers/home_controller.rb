class HomeController < ApplicationController
    LIMITED_POSTS_NUMBER = 6

    def index
      if params[:page]
        @page = params[:page].to_i
      else
        @page = 1
      end
  
      @posts = Post.most_recent
      @products = Product.most_recent
  
      @first_page = 1
      posts_count = @posts.count
  
      if posts_count % LIMITED_POSTS_NUMBER == 0
        @last_page = ( posts_count / LIMITED_POSTS_NUMBER )
      else
        @last_page = ( posts_count / LIMITED_POSTS_NUMBER ) + 1
      end
  
      @posts = @posts.offset((@page - 1) * LIMITED_POSTS_NUMBER).limit(LIMITED_POSTS_NUMBER)
    end
end
