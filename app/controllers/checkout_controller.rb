class CheckoutController < ApplicationController

  def show
    # @article_orders = Article_orders.find(params[:id])
    # @article_orders = ArticleOrder.all
    # @render_order = false
    # @stores = Store.all
    # return unless params[:query].present?

    # # sql_subquery = <<~SQL
    # #   stores.title ILIKE :query
    # #   OR articles.title ILIKE :query
    # # SQL

    # @stores = @stores.joins(:articles).where(sql_subquery, query: "%#{params[:query]}%").distinct

  end

  def index

  end
end
