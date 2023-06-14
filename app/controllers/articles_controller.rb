class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @order = Order.find_by(user_id: current_user.id)
    @article_order = @order.article_orders.find_by(article_id: @article.id)
  end
end
