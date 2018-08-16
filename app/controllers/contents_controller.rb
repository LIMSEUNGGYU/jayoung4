class ContentsController < ApplicationController
  def index
  end
  
  def new
    @person = Person.find(params[:person_id])
  end
  
  def create
    @person = Person.find(params[:person_id])
    @content = @person.contents.new(content_params)
    @content.save()
    
    redirect_to :back
  end
  
  def show
    @content = Content.find(params[:id])   #id를 통해서 저장된 값을 찾아서 article이란 변수에 저장 출력
  end
  
  def edit
    @content = Content.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    
    redirect_to person_contents_path
  end
  
  def destroy
    content = Content.find(params[:id])
    content.destroy   #삭제를 해도 할당된 id에 저장된 값은 그대로 유지된다.
    
    redirect_to person_contents_path
  end
  
  
  private
    def content_params
      params.require(:content).permit(:inout, :category, :title, :cost, :memo, :user_id)
    end
end