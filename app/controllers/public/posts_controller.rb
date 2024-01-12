class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comment = Comment.new
  end

  def edit
    user
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:shop_genre, :shop_name, :address, :post_image, :posting_text)
  end
 
  
end



