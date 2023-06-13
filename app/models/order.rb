class Order < ApplicationRecord
  belongs_to :user
  has_many :article_orders
  has_many :articles, through: :article_orders

  validates :number, presence: true
  validates :number, uniqueness: true
  validates :delivery_time, presence: true

  # geocoded_by :addres
  # after_validation :geocode, if: :will_save_change_to_address?

  def total
    article_orders.to_a.sum { |article_order| article_order.total }
  end
end
