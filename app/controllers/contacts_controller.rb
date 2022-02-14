class ContactsController < ApplicationController
    def index
        @contactus = Contact.find(1)
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to contactus_path
        else
            render contactus_path, status: :unprocessable_entity
        end
    end
    def contact_params
        params.require(:conatact).permit(:contact_person, :contact_address, :contact_number, :contact_email)
      end
    
end
