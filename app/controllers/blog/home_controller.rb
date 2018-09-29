module Blog
  class HomeController < BlogController
    PRODUCTS_COUNT = 21
    LIMITED_PRODUCTS_NUMBER = 9

    def index
    end

    def market
      if params[:page]
        @page = params[:page].to_i
      else
        @page = 1
      end

      @first_page = 1
      if PRODUCTS_COUNT % LIMITED_PRODUCTS_NUMBER == 0
        @last_page = ( PRODUCTS_COUNT / LIMITED_PRODUCTS_NUMBER )
      else
        @last_page = ( PRODUCTS_COUNT / LIMITED_PRODUCTS_NUMBER ) + @first_page
      end
      
      @products = []
      
      (1..PRODUCTS_COUNT).each do |index|
        product = {
            id: index,
            name: "柳橙汁#{index}",
            price: "NT$3000",
            image_url: "images/TATA獨角獸2.jpg",
        }

        @products << product
      end

      @products = @products[(@page - 1) * LIMITED_PRODUCTS_NUMBER, LIMITED_PRODUCTS_NUMBER]
    end
  end
end
