class OrdersController < ApplicationController
    
    def index
        @orders = Order.where(user_id: current_user.id).order(:created_at).reverse_order 
    end

    def show
        @order = Order.where(user_id: current_user.id).where(id: params[:id]).first
        
    end
    
    def new
        @order = Order.new
        @carts = Cart.where(user_id: current_user.id)
        @addresses = Address.where(user_id: current_user.id)
    end

    def create
        # fetched current users cart stuff
        @carts = Cart.where(user_id: current_user.id)
        # total: amount of order 
        total = 0 
        # iteration to calculate total amount of order
        @carts.each do |cart|
            # total: total + ( cart quantity * cart's product price  )
            total += cart.quantity * cart.product&.price
        end
        # created new order 
        @order = Order.new do |order|
            order.user_id = current_user.id
            order.address_id = params[:address_id]
            order.total_amount = total.to_f
            order.order_date = Date.today.to_s
        end
        if @order.save
            @user = User.find(@order.user_id)   
            
            # send order confirmation Email to user
            OrderMailer.with(order: @order, user: @user).order_created.deliver_later
            
            @carts.each do |cart|
                # find product based on in cart included product_id
                @product = Product.find(cart.product&.id) 
            
                @product.quantity = @product.quantity - cart.quantity
                @product.save
                # calculated amount: product price * product quantity into cart1 
                amount = cart.product&.price * cart.quantity
                # inserted order and product details into order_product table
                OrderProduct.create(order_id: @order.id, product_id: cart.product_id, quantity: cart.quantity, amount: amount)
            end
            # removed all products from cart table after order got placed
            @carts.destroy_all
            redirect_to products_path
        else
            render :new, status: :unprocessable_entity
        end
    end

   
    def destroy
        @order = Order.find(params[:id])
        if @order.destroy
            redirect_to orders_path
        else
            redirect_to orders_path, alert: "something wents wrong"
        end
    end

end



=begin          
            first logic for product stock management
                    p @product.quantity
                    old_quantity = @product.quantity
                    p old_quantity
                    reduce = cart.quantity
                    p reduce
                    current_quantity = old_quantity - reduce
                    p current_quantity
                    # using update method
                # @product.update(quantity:  current_quantity)
                    # using Object (instance)
                # @product.quantity = current_quantity
                # @product.save
=end
      