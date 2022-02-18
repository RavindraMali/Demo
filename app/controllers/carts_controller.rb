class CartsController < ApplicationController


    def index
        user_id = current_user.id
        @carts = Cart.where(user_id: user_id)
    end

    def create
        @cart = Cart.new
        @cart.user_id = current_user.id
        p params[:product_id]
        @cart.product_id = params[:product_id]
        @cart.quantity = 1
        if @cart.save
            redirect_to carts_path
        else
            redirect_to products_path
        end
    end

    def destroy
        @cart = Cart.find(params[:id])
        if @cart.destroy
            redirect_to carts_path
        else
            render :index, status: :unprocessable_entity
        end
    end
    # def cart_params
    #     params.require(:cart).permit(:user_id, :product_id, :quentity)    
    # end
end
