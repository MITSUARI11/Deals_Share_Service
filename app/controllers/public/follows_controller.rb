class Public::FollowsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
  end
end
