class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.page(params[:page]).per(20)
  end
  
  def my_page
    @user = current_user
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end

  def edit
   @user = current_user
  end
  
  def update
    user = current_user
    user.update(user_params)
    redirect_to users_my_page_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:user_name, :profile, :icon_image, :is_active)
  end
  
end

  