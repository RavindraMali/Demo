class AddressesController < ApplicationController

    def index
        @addresses = Address.where(user_id: current_user.id)
    end

    def new
        @address = Address.new
    end

    def show
        @address = Address.find(params[:id])
        render 'view'
    end
    
    def create
        @address = Address.new(addresses_params)
        @address.user_id = current_user.id
        if @address.save
            redirect_to addresses_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @address = Address.find(params[:id])
    end
    
    def update
        @address = Address.find(params[:id])
        @address.update(addresses_params)
        if @address.save
            redirect_to addresses_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @address = Address.find(params[:id])
        if @address.destroy
            redirect_to addresses_path
        else
            render :index, status: :unprocessable_entity
        end
    end
    def addresses_params
        params.require(:address).permit(:street1, :street2, :city, :state, :country, :pincode)
    end
end
