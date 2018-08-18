class ContentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def new
    @person = Person.find(params[:person_id])
  end
  
  def create
    @person = Person.find(params[:person_id])
    @content = @person.contents.new(content_params)
    
    # if @content.inout == '수입'
    #   @person.sum += @content.cost
    # elsif @content.inout == '지출'
    #   @person.sum -= @content.cost     #sum 값의 변경을 허락하지않아서 생김
    # end
    
    # @person.update(params.permit(:sum))
    
    if @content.save()
      redirect_to @person
    else
      redirect_to new_person_content_path
    end
  end
  
  def show
    # @person = Person.find(params[:id])
    # @contents = @person.contents
    # @contents = @person.contents.order("created_at DESC").page(params[:page])
    @person = Person.find(params[:person_id])
    @contents = @person.contents
    # @content = Content.find(params[:id])   #id를 통해서 저장된 값을 찾아서 article이란 변수에 저장 출력
  end
  
  def edit
    @content = Content.find(params[:id])
    @person = Person.find(@content.person_id)
    
    # if @content.inout == '수입'
    #   @person.sum -= @content.cost
    # elsif @content.inout == '지출'
    #   @person.sum += @content.cost     #sum 값의 변경을 허락하지않아서 생김
    # end
    
    # @person.update(params.permit(:sum))
  end
  
  def update
    # @person = Person.find(params[:id])
    # @content = @person.contents.find(params[:content])
    @content = Content.find(params[:id])
    @person = Person.find(@content.person_id)
    
    # if @content.inout == '수입'
    #   @person.sum += @content.cost
    # elsif @content.inout == '지출'
    #   @person.sum -= @content.cost     #sum 값의 변경을 허락하지않아서 생김
    # end
    
    if @content.update(content_params)
      # @person.update(params.permit(:sum))
       redirect_to @person
     else
       redirect_to new_person_content_path(@person)
    end
  end
  
  def destroy
    @content = Content.find(params[:id])
    @person = Person.find(@content.person_id)
    
    # if @content.inout == '수입'
    #   @person.sum -= @content.cost
    # elsif @content.inout == '지출'
    #   @person.sum += @content.cost     #sum 값의 변경을 허락하지않아서 생김
    # end
    # @person.update(params.permit(:sum))
    @content.destroy   #삭제를 해도 할당된 id에 저장된 값은 그대로 유지된다.
    
    redirect_to @person 
  end
  
  
  private
    def content_params
      params.require(:content).permit(:inout, :category, :title, :cost, :memo, :date, :user_id)
    end
end
