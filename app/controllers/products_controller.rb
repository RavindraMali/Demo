class ProductsController < ApplicationController

    before_action :authenticate_user!
    
    def index
        @products = Product.where("status = 0")
    end

    def show
        @product = Product.where("status = 0 and id = ?", params[:id]).first
        if !@product
            redirect_to products_path, alert: "Product Not Exist" 
        end
    end
end
