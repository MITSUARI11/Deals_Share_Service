class Public::LikesController < ApplicationController
  
  def create
    post = Post.find(parsms[:post_id])
    like = current_user.favorites.new(post_id: post.id)
    like.save
    redirect_to post_path(post_id)
    
  end
  
  def destroy
  end
  
end
