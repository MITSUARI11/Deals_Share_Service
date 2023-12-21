class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
  end

  def index
  end

  def edit
  end
end
