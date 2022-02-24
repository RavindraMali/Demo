class ProductsController < ApplicationController

    before_action :authenticate_user!
    
    def index
        @products = Product.where("status = 0")
    end

    def search
        # @products = Product.where("name LIKE  ? OR title LIKE ?","%#{params[:search]}%","%#{params[:search]}%")
        @products = Product.search(params[:search])
        render "index"
    end

    def show
        @product = Product.where("status = 0 and id = ?", params[:id]).first
        if !@product
            redirect_to products_path, alert: "Product Not Exist" 
        end
    end
end
