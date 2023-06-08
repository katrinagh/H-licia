class ArticleOrdersController < ApplicationController
  def index
    @article_orders = ArticleOrder.all
  end

  def create
    @article_order = ArticleOrder.new(article_order_params)
    @article_order.order = @order
    if @article_order.save
      redirect_to list_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end 
end
