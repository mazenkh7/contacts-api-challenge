class EditsController < ApplicationController
    
    before_action :set_edit, only: [:show, :update, :destroy]

    def index
        render json: Edit.all
    end

    def show
        render json: @edit
    end

    def update
        if @edit.update(edit_params)
            render json: @edit
        else
            render json: @edit.errors, status: unprocessable_entity
        end
    end

    def destroy
        @edit.destroy
        render json: Edit.all
    end

    def create #post and return all edits
        @edit = Edit.new(edit_params)
        if @edit.save
            render json: Edit.all
        else
            render json: @edit.errors, status: :unprocessable_entity
        end
    end
    
    private
        def set_edit 
            @edit = Edit.find(params[:id])
        end

        def edit_params
            params.require(:edit).permit(:id, :contactid, :fname, :lname, :number, :email)
        end
end
