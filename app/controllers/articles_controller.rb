class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show; end

  # New? Voir si enlever
  def new
    @article = Article.new
  end

  # New? Voir si enlever
  def create
    @article = Article.create(article_params)
    rediect_to articles_path
  end

  def edit; end

  def update
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :image_url, :category, :price, :weight)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
