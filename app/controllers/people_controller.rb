class PeopleController < ApplicationController
    before_action :authenticate_user!
    
    def new
    end
    
    def index
        @people = Person.order(:name)
    end
    
    def create
        @person = Person.new(params.require(:person).permit(:name, :phone, :relation, :user_id, :image))
        
        if @person.save
            redirect_to people_path
        else
            redirect_to new_person_path
        end
    end
    
    def show
        @person = Person.find(params[:id])
        @contents = Content.order("created_at DESC").page(params[:page])
    end
    
    def destroy
        person = Person.find(params[:id])
        person.destroy
        
        redirect_to people_path
    end
    
    def edit
        @person = Person.find(params[:id])
    end
    
    def update
        params.permit!
        @person = Person.find(params[:id])
        @person.update(params[:person])
        
        redirect_to @person
    end

    
end
