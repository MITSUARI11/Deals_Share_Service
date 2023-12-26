class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit]
  
  def new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  private
  
 
  
end



