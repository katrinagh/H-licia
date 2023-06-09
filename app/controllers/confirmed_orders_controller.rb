class ConfirmedOrdersController < ApplicationController
  def index
    @confirmed_orders = ConfirmedOrder.all
  end

  def show
    @confirmed_order = ConfirmedOrder.find(params[:id])
  end

  def new
    @confirmed_order = ConfirmedOrder.new
  end

  def create
    @confirmed_order = ConfirmedOrder.new(confirmed_order_params)
    @current_order.article_orders.each do |article|
      @order.article_orders << article
      article.order_id = nil
    end
    @confirmed_order.save
    Order.destroy(session[:order_id])
    session[:order_id] = nil
    redirect_to root_path
  end

  private

  def order_params
    params.require(:confirmed_order).permit(:name, :email, :address, :pay_method)
  end
end
