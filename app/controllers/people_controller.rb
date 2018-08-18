class PeopleController < ApplicationController
    before_action :authenticate_user!
    
    def new
    end
    
    def index
        @people = Person.all.order(:name)
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
        
        # redirect_to person_content_path(@person)
        @contents = @person.contents
        # @contents = @person.contents.paginate(:page => params[:page], :per_page => 5)
        # @contents = @person.contents.order("created_at DESC").page(params[:page])
        
        @person.contents.each do |content|
          if content.inout == '수입'
            @person.sum += content.cost
          elsif content.inout == '지출'
            @person.sum -= content.cost
          end
        end
        
        @person.update(params.permit(:sum))
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
        @person = Person.find(params[:id])
        @person.update(params.require(:person).permit(:name, :phone, :relation, :user_id, :image))
        
        redirect_to people_path
    end
    
    def search
        @people = Person.search do
            fulltext params[:search]
        end.results
        
        if params[:search] == ""
            redirect_to people_path
        else
            respond_to do |format|
                format.html { render :action => "index" }
                format.xml  { render :xml => @people }
            end
        end
    end
    
end