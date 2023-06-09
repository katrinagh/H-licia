class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # New? Voir si enlever
  def new
    @article = Article.new
  end

  # New? Voir si enlever
  def create
    @article = Article.create(article_params)
    rediect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image_url, :category, :price, :weight)
  end
end
