class PostsController < ApplicationController
  before_action :authenticate_author!, except: [:index, :show]

  def index
    @posts = Post.most_recent
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
