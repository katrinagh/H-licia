class Article < ApplicationRecord
  belongs_to :store
  has_many :article_orders
  has_many :orders, through: :article_orders

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :price, presence: true
  validates :weight, presence: true
end
