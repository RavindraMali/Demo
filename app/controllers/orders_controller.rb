class OrdersController < ApplicationController
    
    def index
    end

    def show
    end
    
    def new
        @order = Order.new
        @carts = Cart.where(user_id: current_user.id)
        @quantity = 0
        @total = 0 
        @carts.each do |cart|
            @quantity+=cart.quantity
            @total += cart.quantity * cart.product&.price
        end
        @addresses = Address.where(user_id: current_user.id)
    end

    def create
        @order = Order.new
        @order.user_id = current_user.id
        @order.address_id = params[:address_id]
        @order.total_amount = params[:total_amount]
        @order.order_date = Date.today.to_s
        if @order.save
            redirect_to products_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
    end

end
