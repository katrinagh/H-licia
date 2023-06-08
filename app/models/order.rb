class Order < ApplicationRecord
  belongs_to :user
  has_many :article_orders

  validates :number, presence: true
  validates :number, uniqueness: true
  validates :delivery_time, presence: true
  validates :confirmed, presence: true
end
