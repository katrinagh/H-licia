class Order < ApplicationRecord
  belongs_to :user
  has_many :article_orders
  has_many :articles, through: :article_orders

  validates :number, presence: true
  validates :number, uniqueness: true
  validates :delivery_time, presence: true

  def total
    article_orders.to_a.sum { |article_order| article_order.total }
  end
end
