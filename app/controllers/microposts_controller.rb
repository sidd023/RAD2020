class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create,:destroy]

  def new
      @micropost= Micropost.new       
  end

  def create
    @micropost= Micropost.create(micropost_params)  
    if @micropost.save
      redirect_to index_path
    else
      flash.now[:notice]="INVALID"
      render 'new'
    end
  end 

  def destroy 
  end 


  


  private 
  
  def micropost_params
      params.require(:micropost).permit(:content, :topic, :title, :views, :comment, :name, :user_id)
  end

  
end
