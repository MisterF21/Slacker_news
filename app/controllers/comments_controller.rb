class CommentsController < ApplicationController

  def index
    @article = Article.find(params[:article_id])
    @comments = Comment.all
    @articles = Article.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(user_params)
    if @comment.save
      redirect_to("/articles/#{@article_id}/comments")
    else
      redirect_to("/articles/")
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  # def update
  #   show
  #   if @article.update(user_params)
  #     redirect_to("/articles")
  #   else
  #     redirect_to("/articles/#{@article.id}")
  #   end
  # end

  # def destroy
  #   show
  #   if @article.destroy
  #     redirect_to("/articles")
  #   else
  #     show
  #   end
  # end

  private
   def user_params
     params.require(:comment).permit(:author, :comment, :commentable_id, :commentable_type)
   end
end
