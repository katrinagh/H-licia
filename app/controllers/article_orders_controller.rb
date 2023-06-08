class ArticleOrdersController < ApplicationController
  def index
    @article_orders = ArticleOrder.all
  end
end
