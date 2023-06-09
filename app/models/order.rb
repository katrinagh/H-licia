class Order < ApplicationRecord
  has_many :article_orders, dependent: :destroy
  has_many :articles, through: :article_orders

  # LOGIC
  def sub_total
    sum = 0
    article_orders.each do |article_order|
      sum += article_order.total_price
    end
    sum
  end
end
