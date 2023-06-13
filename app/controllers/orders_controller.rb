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
    if current_article_item && quantity.positive?
      current_article_item.update(quantity:)
      # flash[:notice] = 'Article updated'
    elsif quantity <= 0
      current_article_item.destroy
      # flash[:notice] = 'Article removed from cart'
    else
      @order.article_orders.create(article: @article, quantity:)
      # flash[:notice] = 'Article added to cart'
    end

    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to order_path(@order) }
    #     format.json # Follow the classic Rails flow and look for a create.json view
    #   else
    #     format.html { render 'orders/show', status: :unprocessable_entity }
    #     format.json # Follow the classic Rails flow and look for a create.json view
    #   end
    # end
  end

  def remove
    ArticleOrder.find_by(id: params[:id]).destroy
  end
end
