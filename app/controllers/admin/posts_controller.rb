class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
  end

  def index
    @posts = Post.page(params[:page]).per(15)
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
  end
end
