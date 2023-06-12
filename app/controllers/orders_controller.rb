class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def add
    @article = Article.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_article_item = @order.article_orders.find_by(article_id: @article.id)
    if current_article_item && quantity > 0
      current_article_item.update(quantity:)
    elsif quantity <= 0
      current_article_item.destroy
    else
      raise
      @order.article_orders.create(article: @article, quantity:)
    end
    redirect_to order_path(@order)
  end

  def remove
    ArticleOrder.find_by(id: params[:id]).destroy
  end
end
