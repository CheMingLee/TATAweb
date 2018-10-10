class ProductsController < ApplicationController
  before_action :authenticate_author!, only: [:new, :create, :edit, :update, :destroy]
  LIMITED_PRODUCTS_NUMBER = 6

  def index
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end

    @products = Product.all

    @first_page = 1
    count = @products.count
    
    @last_page = ( count / LIMITED_PRODUCTS_NUMBER )
    if (count % LIMITED_PRODUCTS_NUMBER)
      @last_page += 1
    end
        
    @products = @products.offset((@page - 1) * LIMITED_PRODUCTS_NUMBER).limit(LIMITED_PRODUCTS_NUMBER)
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_permit)
    
    redirect_to action: :index
  end

  def edit
    @product = Product.find(params[:id])
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
