class ContactsController < ApplicationController
    
    before_action :set_contact, only: [:show, :update, :destroy]

    def index
        render json: Contact.all
    end

    def show
        render json: @contact
    end

    def update
        print("mazzika", @contact.email, " ", contact_params[:email])
        emailTaken = Contact.exists?(email: contact_params[:email])
        if (emailTaken && (@contact.email == contact_params[:email])) || !emailTaken #check email not taken
            if @contact.update(contact_params)
                render json: @contact
            else
                render json: @contact.errors, status: unprocessable_entity
            end
        else 
            render json: @contact.errors, status: :unprocessable_entity
        end
    end

    def destroy
        Edit.where(contactid: @contact.id).destroy_all()
        @contact.destroy
        render json: Contact.all
    end

    def create #post and return all contacts        
        @contact = Contact.new(contact_params)
        if !Contact.exists?(email: @contact.email) #check email not taken
            if @contact.save
                render json: @contact
            else
                render json: @contact.errors, status: :unprocessable_entity
            end
        else 
            render json: @contact.errors, status: :email_exists
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
