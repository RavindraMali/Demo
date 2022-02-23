class CartsController < ApplicationController

    def index
        @carts = Cart.where(user_id: current_user.id)
    end

    def create
         @cart = Cart.find_by(product_id: params[:product_id])
        if @cart
            if  @cart.product&.quantity < @cart.quantity + 1
                redirect_to products_path, alert: "only #{@cart.product&.quantity} #{@cart.product&.name} are available!!"
            else
                quantity = @cart.quantity + 1 
                @cart.update(quantity: quantity)
                redirect_to carts_path, notice: "#{@cart.product&.name} added to cart"
            end
        else
            @cart = Cart.new
            @cart.user_id = current_user.id
            @cart.product_id = params[:product_id]
            @cart.quantity = 1
            if @cart.save
                redirect_to carts_path, notice: "#{@cart.product&.name} added to cart"
            else
                redirect_to products_path, notice: "could not added to cart"
            end
        end
    end
    
    def edit
        @cart = Cart.find(params[:id])
    end

    def update
        @cart = Cart.find(params[:id])

        if  @cart.product&.quantity < params[:cart][:quantity].to_i
            redirect_to carts_path, alert: "only #{@cart.product&.quantity} #{@cart.product&.name} are available!!"
        else
            @cart.update(quantity: params[:cart][:quantity])
            redirect_to carts_path, notice: "cart details updated"
        end
    end

    def destroy
        @cart = Cart.find(params[:id])
        if @cart.destroy
            redirect_to carts_path, notice: "#{@cart.product&.name} removed from cart"
        else
            redirect_to carts_path, alert: "Could not found product"
        end
    end
    # def cart_params
    #     params.require(:cart).permit(:user_id, :product_id, :quentity)    
    # end
end
