class PostsController < ApplicationController
  before_action :authenticate_author!, except: [:index, :show]
  LIMITED_POSTS_NUMBER = 3

  def index
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end

    @posts = Post.most_recent

    @first_page = 1
    posts_count = @posts.count

    if posts_count % LIMITED_POSTS_NUMBER == 0
      @last_page = ( posts_count / LIMITED_POSTS_NUMBER )
    else
      @last_page = ( posts_count / LIMITED_POSTS_NUMBER ) + 1
    end

    @posts = @posts.offset((@page - 1) * LIMITED_POSTS_NUMBER).limit(LIMITED_POSTS_NUMBER)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.friendly.find(params[:id])
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  def update
    post = Post.friendly.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    post = Post.friendly.find(params[:id])
    post.destroy
    redirect_to action: :index
  end

  def post_params
    params.require(:post).permit(:title, :body, :description, :banner_image_url)
  end
end
