class Store < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :rating, presence: true
  validates :estimated_delivery_time, presence: true
  validates :delivery_fees, presence: true
end
