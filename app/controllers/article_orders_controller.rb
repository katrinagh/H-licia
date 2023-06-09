class ArticleOrdersController < ApplicationController
  def create
    # Find associated article and current order
    chosen_article = Article.find(params[:article_id])
    current_order = @current_order

    # If order already has this article then find the relevant article_order and iterate quantity otherwise create a new article_order for this article
    if current_order.articles.include?(chosen_article)
      # Find the article_order with the chosen_article
      @article_order = current_order.article_orders.find_by(article_id: chosen_article)
      # Iterate the article_order's quantity by one
      @article_order.quantity += 1
    else
      @article_order = ArticleOrder.new
      @article_order.order = current_order
      @article_order.article = chosen_article
    end

    # Save and redirect to order show path
    @article_order.save
    redirect_to order_path(current_order)
  end

  def destroy
    @article_order = ArticleOrder.find(params[:id])
    @article_order.destroy
    redirect_to order_path(@current_order)
  end

  def add_quantity
    @article_order = ArticleOrder.find(params[:id])
    @article_order.quantity += 1
    @article_order.save
    redirect_to order_path(@current_order)
  end

  def reduce_quantity
    @article_order = ArticleOrder.find(params[:id])
    @article_order.quantity -= 1 if @article_order.quantity > 1
    @article_order.save
    redirect_to order_path(@current_order)
  end

  private

  def article_order_params
    params.require(:article_order).permit(:quantity, :article_id, :order_id)
  end
end
