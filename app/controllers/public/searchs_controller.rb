class Public::SearchsController < ApplicationController
  before_action :authenticate_user!
  
  def search
    # ユーザー検索
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == "User"
      @records = User.search_for(@content, @method)
    end
    
    # 投稿検索
    column = params[:search_column]
    text = params[:content]
    if @model == "Post"
      @result = Post.search_by_column(column, text)
    end

  end
  
end


