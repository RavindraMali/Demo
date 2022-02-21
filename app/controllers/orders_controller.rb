class OrdersController < ApplicationController
    
    def index
    end

    def show
    end
    
    def new
        @order = Order.new
        @carts = Cart.where(user_id: current_user.id)
        @addresses = Address.where(user_id: current_user.id)
    end

    def create
        @carts = Cart.where(user_id: current_user.id)
        total = 0 
        @carts.each do |cart|
            total += cart.quantity * cart.product&.price
        end
        @order = Order.new do |order|
            order.user_id = current_user.id
            order.address_id = params[:address_id]
            order.total_amount = total.to_f
            order.order_date = Date.today.to_s
        end
        if @order.save
            @carts.each do |cart|
                amount = cart.product&.price * cart.quantity
                p cart.product&.id
                @product = Product.find(cart.product&.id) 
                p @product.quantity
                    old_quantity = @product.quantity
                    reduce = cart.quantity
                    current_quantity = old_quantity - reduce
                @product.update(quantity:  current_quantity)
                
                OrderProduct.create(order_id: @order.id, product_id: cart.product_id, quantity: cart.quantity, amount: amount)
            end
            @carts.destroy_all
            redirect_to products_path
        else
            render :new, status: :unprocessable_entity
        end
    end

   
    def destroy
    end

end
