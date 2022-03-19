class ContactsController < ApplicationController
    
    before_action :set_contact, only: [:show, :update, :destroy]

    def index
        @contacts = Contact.all
        render json: @contacts
    end

    def show
        render json: @contact
    end

    def update

    end

    def destroy
        @contact.destroy
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            render json: @contact
        else
            render json: @contact.errors, status: :unprocessable_entity
        end
    end
    
    private
        def set_contact
            @contact = Contact.find(params[:id])
        end

        def contact_params
            params.require(:contact).permit(:id, :fname, :lname, :number, :email)
        end
end
