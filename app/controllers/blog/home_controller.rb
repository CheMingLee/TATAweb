module Blog
  class HomeController < BlogController
    PRODUCTS_COUNT = 21
    LIMITED_PRODUCTS_NUMBER = 9

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
            name: "TATA獨角獸#{index}",
            price: "NT$0",
            image_url: "https://scontent.ftpe8-3.fna.fbcdn.net/v/t1.0-9/32349502_809483579249473_4474655649489223680_o.jpg?_nc_cat=110&oh=4fce2e07b4bd4bf6a8f2e290edaa1227&oe=5C1A09A3",
        }

        @products << product
      end

      @products = @products[(@page - 1) * LIMITED_PRODUCTS_NUMBER, LIMITED_PRODUCTS_NUMBER]
    end
  end
end
