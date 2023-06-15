class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
    elsif quantity <= 0
      current_article_item.destroy
    else
      @order.article_orders.create(article: @article, quantity:)
    end

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_path(@order) }
        # format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render 'orders/show', status: :unprocessable_entity }
        # format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def remove
    ArticleOrder.find_by(id: params[:id]).destroy
  end

  def checkout; end

  def confirmation
    @marker_user =
      {
        lat: current_user.latitude,
        lng: current_user.longitude,
        info_window_html: render_to_string(partial:
        'info_window', locals: { user: current_user }),
        marker_html: render_to_string(partial: 'marker_user', locals: { user: current_user })
      }

    @marker_order =
      {
        lat: @order.latitude,
        lng: @order.longitude,
        info_window_html: render_to_string(partial:
        'info_window_order', locals: { order: @order }),
        marker_html: render_to_string(partial: 'marker_order', locals: { order: @order })
      }
  end
end
