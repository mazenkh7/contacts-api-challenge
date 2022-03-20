class ContactsController < ApplicationController
    
    before_action :set_contact, only: [:show, :update, :destroy]

    def index
        render json: Contact.all
    end

    def show
        render json: @contact
    end

    def update
        if @contact.update(contact_params)
            render json: @contact
        else
            render json: @contact.errors, status: unprocessable_entity
        end
    end

    def destroy
        @contact.destroy
        render json: Contact.all
    end

    def create #post and return all contacts
        @contact = Contact.new(contact_params)
        if @contact.save
            render json: Contact.all
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
