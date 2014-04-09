class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(user_params)
    if @article.save
      redirect_to ("/articles")
    else
      redirect_to("/articles/new")
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def update
    show
    if @article.update(user_params)
      redirect_to("/articles")
    else
      redirect_to("/articles/#{@article.id}")
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to("/articles")
    else
      show
    end
  end

  def vote
    @article = Article.find(params[:id])
    @article.update_attributes("Vote", vote_id + 1)
  end

  private
  def user_params
    params.require(:article).permit(:author, :title, :url)
  end
end
