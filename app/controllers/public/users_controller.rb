class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end
  
  def my_page
    @user = current_user
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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
    params.require(:user).permit(:user_name, :profile)
  end
  
end

  