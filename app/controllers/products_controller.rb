class ProductsController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create, :edit, :update, :destroy]
  LIMITED_PRODUCTS_NUMBER = 6

  def index
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end

    @products = Product.most_recent

    @first_page = 1
    products_count = @products.count

    if products_count % LIMITED_PRODUCTS_NUMBER == 0
      @last_page = ( products_count / LIMITED_PRODUCTS_NUMBER )
    else
      @last_page = ( products_count / LIMITED_PRODUCTS_NUMBER ) + 1
    end

    @products = @products.offset((@page - 1) * LIMITED_PRODUCTS_NUMBER).limit(LIMITED_PRODUCTS_NUMBER)
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_permit)
    redirect_to action: :index
  end

  def edit
    @product = Product.find_by_id(params[:id])
    if @product.blank?
      redirect_to root_path
      return
    end
  end
  
  def update    
    product = Product.find(params[:id])
    product.update(product_permit)   
    redirect_to action: :index
  end
  
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to action: :index
  end
  
  def product_permit
    params.require(:product).permit([:name, :description, :image_url, :price])
  end
end
