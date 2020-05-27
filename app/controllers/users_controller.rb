class UsersController < ApplicationController
  before_action :logged_in_user,only:[:index,:edit,:update,:destroy]
  
  def show
    @user = User.find(params[:id])
    @micropost = @user.microposts.order(created_at: :DESC)
  end

  def new
    @user = User.new
  end

  def index
    @user = User.all
    @microposts=Micropost.order(created_at: :DESC)
    
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user 
      redirect_to index_path
    else 
      render'new'
    end 
  end


  def guest
    @user=User.new
    @microposts=Micropost.order(created_at: :DESC)
  end

  


  

  private 
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:mobile)
    end


  # Confirms the correct user.
  def correct_user
    @user=User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
  
  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end




end
