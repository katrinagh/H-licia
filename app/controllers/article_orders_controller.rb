class ArticleOrdersController < ApplicationController
  def index
    @article_orders = ArticleOrder.all
  end

  def create
    time = Time.now.to_datetime
    @article = Article.find(params[:article_id])
    @order = Order.find_or_initialize_by(user: current_user)
    @order.number = SecureRandom.hex(6)
    @order.delivery_time = time
    @order.confirmed = false
    @article_order = ArticleOrder.new(order: @order, article: @article, quantity: 1)
    if @order.new_record? && @order.save && @article_order.save
      flash[:notice] = 'Article added to cart'
      redirect_back fallback_location: @article
    else
      flash[:error] = 'Failed to create/update order.'
      redirect_to @article
    end
  end
end
